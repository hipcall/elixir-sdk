defmodule HipcallSdk.Cdr do
  @moduledoc """
  This module provides Hipcall Call API functionality.
  """
  @moduledoc since: "0.1.0"
  use HTTPoison.Base

  @doc """
  Get a CDR.

  ## Examples

      iex> HipcallSdk.Cdr.retrieve(year: "2022", month: "10", day: "18", uuid: "caedfd1b-25ec-447e-ad87-3b7eb3d358ea")

  ## Documentation

  Docs: [https://app.hipcall.com/docs#call-GETapi-v20211124-cdrs--yyyy---mm---dd---uuid-](https://app.hipcall.com/docs#call-GETapi-v20211124-cdrs--yyyy---mm---dd---uuid-)
  """
  @doc since: "0.1.0"
  def retrieve(params) do
    headers = [
      {"Authorization", "Bearer #{HipcallSdk.Config.api_key()}"},
      {"Accept", "Application/json; Charset=utf-8"},
      {"Content-Type", "Application/json"}
    ]

    HipcallSdk.Cdr.get(
      "#{System.get_env("HIPCALL_API_ENDPOINT")}/cdrs/#{params[:year]}/#{params[:month]}/#{params[:day]}/#{params[:uuid]}",
      headers
    )
  end
end
