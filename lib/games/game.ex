defmodule Game2048Api.Game do
  use Ecto.Schema

  schema "games" do
    field(:hash, :string)
    field(:value_matrix, :string)
    field(:score, :integer)
  end

  def changeset(game, params \\ %{}) do
    game
    |> Ecto.Changeset.cast(params, [:hash, :value_matrix, :score])
    |> Ecto.Changeset.validate_required([:value_matrix, :score])
  end
end
