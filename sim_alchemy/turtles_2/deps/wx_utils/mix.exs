defmodule WxUtils.Mixfile do
  use Mix.Project

  def project do
    [app: :wx_utils,
     version: "0.0.2",
     elixir: "~> 1.2",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: description,
     package: package]
  end


  def application do
    [applications: [:logger]]
  end


  defp deps do
    []
  end

  defp description do
    """
    All of the erlang wx macros exposed as normal functions.
    """
  end

  defp package do
    [
     name: :wx_utils,
     files: ["lib", "src", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Sam Schneider"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/sschneider1207/wx_utils"}]
  end
end
