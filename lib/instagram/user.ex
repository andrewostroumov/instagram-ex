defmodule User do
  @enforce_keys [:id]
  defstruct [:id, :name]
end
