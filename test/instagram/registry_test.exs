defmodule Instagram.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, registry} = Instagram.Registry.start_link
    {:ok, registry: registry}
  end

  test "spawn buckets", %{registry: registry} do
    assert Instagram.Registry.lookup(registry, "shopping") == :error

    Instagram.Registry.create(registry, "shopping")
    assert {:ok, bucket} = Instagram.Registry.lookup(registry, "shopping")

    Instagram.Bucket.set(bucket, "milk", 1)
    assert Instagram.Bucket.get(bucket, "milk") == 1
  end

  test "alive registry", %{registry: registry} do
    assert Process.alive?(registry) == true
  end

  test "stops the registry", %{registry: registry} do
    Instagram.Registry.stop(registry)
    assert Process.alive?(registry) == false
  end

  test "removes bucket on exit", %{registry: registry} do
    Instagram.Registry.create(registry, "shopping")
    {:ok, bucket} = Instagram.Registry.lookup(registry, "shopping")

    Agent.stop(bucket)
    assert Instagram.Registry.lookup(registry, "shopping") == :error
  end
end
