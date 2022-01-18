alias Gwia.Repo
alias Gwia.Identities.IdentityTopic

Repo.insert! %IdentityTopic{
  identity_id: 1,
  topic_id: 8
}

Repo.insert! %IdentityTopic{
  identity_id: 2,
  topic_id: 8
}

Repo.insert! %IdentityTopic{
  identity_id: 3,
  topic_id: 9
}

Repo.insert! %IdentityTopic{
  identity_id: 4,
  topic_id: 8
}


Repo.insert! %IdentityTopic{
  identity_id: 4,
  topic_id: 2
}
