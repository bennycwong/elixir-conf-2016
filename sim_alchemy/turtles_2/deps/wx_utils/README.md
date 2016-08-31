# WxUtils

Exposes **all** of the macros associated with the erlang `:wx` modules via a `:wx_const` module.

## Usage

    iex> :wx_const.wxVERTICAL
    8

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add wx_utils to your list of dependencies in `mix.exs`:

        def deps do
          [{:wx_utils, "~> 0.0.1"}]
        end

  2. Ensure wx_utils is started before your application:

        def application do
          [applications: [:wx_utils]]
        end

