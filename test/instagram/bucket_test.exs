defmodule Instagram.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = Instagram.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "get nil value from undefined key", %{bucket: bucket} do
    assert Instagram.Bucket.get(bucket, "key") == nil
  end

  test "get value from defined key", %{bucket: bucket} do
    Instagram.Bucket.set(bucket, "key", 3)
    assert Instagram.Bucket.get(bucket, "key") == 3
  end

  test "return and delete value from bucket", %{bucket: bucket} do
    Instagram.Bucket.set(bucket, "key", 3)

    assert Instagram.Bucket.delete(bucket, "key") == 3
    assert Instagram.Bucket.get(bucket, "key") == nil
  end
end
