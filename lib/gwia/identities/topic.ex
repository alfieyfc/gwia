defmodule Gwia.Identities.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gwia.Identities.IdentityTopic

  schema "topics" do
    field :name, :string

    has_many :identity_topics, IdentityTopic

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint([:name])
  end
end
