defmodule Instagram do
  @moduledoc """
  Provide interface to communicate with internal Instagram API
  """

  @default_instagram_id "Instagram ID"

  @doc """
  Return Instagram ID
  """
  def get do
    @default_instagram_id
  end
end
