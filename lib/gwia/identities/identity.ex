defmodule Gwia.Identities.Identity do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gwia.Identities.IdentityTopic

  schema "identities" do
    field :name, :string
    field :value, :integer

    has_many :identity_topics, IdentityTopic

    timestamps()
  end

  @doc false
  def changeset(identity, attrs) do
    identity
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
    |> unique_constraint([:value])
  end
end
