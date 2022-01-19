alias Gwia.Repo
alias Gwia.Identities.{Identity, Topic, IdentityTopic}
alias Gwia.Utilities.Insert

filename = "test/testfiles/220118-items.json"

filename
|> File.read!()
|> Jason.decode!(keys: :atoms)
|> Enum.each(fn i ->
  if String.contains?(i.img, "itemPhoto") do
    val = String.to_integer(i.value)

    identity = Repo.get_by(Identity, value: val) || Insert.maybe_insert_identity(val, i.label)
    topic = Repo.get_by(Topic, name: i.topic) || Insert.maybe_insert_topic(i.topic)

    identity_topic =
      (Repo.get_by(IdentityTopic, identity_id: identity.id, topic_id: topic.id) ||
         Insert.maybe_insert_identity_topic(identity.id, topic.id))
      |> IO.inspect()
  end
end)
