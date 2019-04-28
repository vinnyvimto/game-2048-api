defmodule Game2048Api.GamesSeeder do
  def seed do
    data = %{value_matrix: "[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]", score: 0}
    game = %Game2048Api.Game{}
    changeset = Game2048Api.Game.changeset(game, data)
    Game2048Api.Repo.insert(changeset)
  end
end

IO.inspect Game2048Api.GamesSeeder.seed()
