defmodule Gwia.Identities.Identity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "identities" do
    field :name, :string
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(identity, attrs) do
    identity
    |> cast(attrs, [:value, :name])
    |> validate_required([:value, :name])
  end
end
