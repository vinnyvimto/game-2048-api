defmodule Game2048ApiTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Game2048Api.Router.init([])

  test "returns Game 2048 API" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = Game2048Api.Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Game 2048 API"
  end
end
