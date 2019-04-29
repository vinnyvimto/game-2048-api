defmodule Game2048Api.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Game2048Api.Repo

      import Ecto
      import Ecto.Query
      import Game2048Api.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Game2048Api.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Game2048Api.Repo, {:shared, self()})
    end

    :ok
  end
end
