defmodule Gwia.Identities.IdentityTopic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gwia.Identities.{Identity, Topic}

  @primary_key false
  schema "identity_topics" do
    belongs_to :identity, Identity
    belongs_to :topic, Topic

    timestamps()
  end

  @doc false
  def changeset(identity_topic, attrs) do
    identity_topic
    |> cast(attrs, [:identity_id, :topic_id])
    |> validate_required([:identity_id, :topic_id])
    |> unique_constraint([:identity_id, :topic_id])
  end
end
