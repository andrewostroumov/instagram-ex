defmodule User do
  @derive Blank
  @enforce_keys [:id]
  defstruct [:id, :name]
end
