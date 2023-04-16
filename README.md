# Hipcall Elixir SDK

This is a work in progress Elixir SDK for Hipcall.

## Installation

### Hex

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hipcall_sdk` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hipcall_sdk, "~> 0.1.0"}
  ]
end
```

### Environment Variables

* HIPCALL_API_KEY=123456
* HIPCALL_API_ENDPOINT="https://api.hipcall.com.tr"

## Run Test

```
export $(xargs < .env.example) && mix test   
```

# License

This project is licensed under the [MIT License](LICENSE).