defmodule HipcallSdkConfigTest do
  use ExUnit.Case

  alias HipcallSdk.Config

  setup do
    api_key = "123456"
    actual_key = System.get_env("HIPCALL_API_KEY")
    System.put_env("HIPCALL_API_KEY", api_key)

    on_exit(fn ->
      System.put_env("HIPCALL_API_KEY", actual_key)
    end)
  end

  test "api_key function returns correct API key" do
    assert Config.api_key() == "123456"
  end

  test "merge credentials function combines user input with Hipcall credentials" do
    input = %{a: "123", b: "456"}
    expected_result = %{a: "123", b: "456", api_key: "123456"}
    result = HipcallSdk.Config.merge_credentials(input)

    assert result == expected_result
  end
end
