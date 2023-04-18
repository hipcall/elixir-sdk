defmodule HipcallSdk.Utils.Header do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      @headers [
        {"Authorization", "Bearer #{HipcallSdk.Config.api_key()}"},
        {"Accept", "Application/json; Charset=utf-8"},
        {"Content-Type", "Application/json"}
      ]
    end
  end
end
