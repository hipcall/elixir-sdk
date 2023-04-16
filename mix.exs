defmodule HipcallSdk.MixProject do
  use Mix.Project

  def project do
    [
      app: :hipcall_sdk,
      version: "0.1.0",
      elixir: "~> 1.14",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      homepage_url: "https://www.hipcall.com",
      source_url: "https://github.com/hipcall/elixir-sdk"
    ]
  end

  defp description() do
    "Hipcall SDK Library for Elixir"
  end

  defp package() do
    [
      name: "hipcall_sdk",
      files: ~w(lib .formatter.exs mix.exs README* README* LICENSE*
                CHANGES* .env.sample),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/hipcall/elixir-sdk"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HipcallSdk.Config, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 2.1"},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end
end
