defmodule Game2048ApiTest do
  use ExUnit.Case, async: true
  use Plug.Test
  use Game2048Api.RepoCase

  @opts Game2048Api.Router.init([])

  test "returns Game 2048 API" do
    # Create a test connection
    conn = conn(:get, "/api/v1")

    # Invoke the plug
    conn = Game2048Api.Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
  end

  test "can retrieve games" do
    result = Game2048Api.Game |> Game2048Api.Repo.all()

    assert is_list(result)
  end
end
