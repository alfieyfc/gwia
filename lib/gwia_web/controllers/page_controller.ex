defmodule GwiaWeb.PageController do
  use GwiaWeb, :controller
  alias Gwia.Repo
  alias Gwia.Identities.{Identity, IdentityTopic}

  import Ecto.Query

  def index(conn, _params) do
    # TODO: query topic.id for selecting identity_topic (currently hardcoding at L#12)
    query =
      from it in IdentityTopic,
        where: it.topic_id == 5,
        select: {it},
        order_by: fragment("RANDOM()"),
        limit: 1

    r_identity_topic =
      Repo.all(query)
      |> List.to_tuple()
      |> elem(0)
      |> elem(0)

    # IO.inspect(r_identity_topic)

    # selected_id = r_identity_topic.identity_id
    # IO.puts(selected_id)

    query =
      from i in Identity,
        where: i.id == ^r_identity_topic.identity_id,
        select: {i}

    r_identity =
      Repo.all(query)
      |> List.to_tuple()
      |> elem(0)
      |> elem(0)

    f_name = r_identity.name
    f_id = Integer.to_string(r_identity.value)

    f_img =
      "https://dvblobcdnjp.azureedge.net/Content/img/top-100/itemPhoto/Keypoitem_" <>
        f_id <> ".jpg"

    render(conn, "index.html", identity_name: f_name, identity_img: f_img)
  end
end
