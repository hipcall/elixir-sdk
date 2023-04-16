defmodule HipcallSdk.Config do
  @moduledoc """
  The `Hipcall.Config` module provides configuration settings and helper functions to the application.
  """
  @moduledoc since: "0.1.0"
  use Application

  def start(_type, _args) do
    children = []
    opts = [strategy: :one_for_one, name: HipcallSdk.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Prints the Hipcall API key stored as an environment variable.

  ## Examples

      iex> HipcallSdk.Config.api_key
      "abcdefgh"

  """
  @doc since: "0.1.0"
  def api_key do
    Application.get_env(:hipcall_sdk, :api_key) || System.get_env("HIPCALL_API_KEY")
  end

  @doc """
  `HipcallSdk.Config.merge_credentials/1` takes the user inputted parameters and merges the user's
  Hipcall API credentials into the map.

  ## Examples

      iex> HipcallSdk.Config.merge_credentials(%{a: '123', b: '456'})
      %{a: '123', b: '456', api_key: '123456789', api_secret: 'this_is_a_sample_secret'}

  """
  @doc since: "0.1.0"
  def merge_credentials(params) do
    params = convert_to_map(params)

    Map.merge(params, %{
      api_key: HipcallSdk.Config.api_key()
    })
  end

  @doc """
  `HipcallSdk.Config.convert_to_map/1` takes the user inputted parameters and converts them into a map.

  ## Examples

      iex> HipcallSdk.Config.convert_to_map({a, '123'})
      %{a: '123'}

  """
  @doc since: "0.1.0"
  def convert_to_map(params) do
    for {key, val} <- params, into: %{} do
      cond do
        is_atom(key) -> {key, val}
        true -> {String.to_atom(key), val}
      end
    end
  end
end
