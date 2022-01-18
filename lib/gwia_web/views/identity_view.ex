defmodule GwiaWeb.IdentityView do
  use GwiaWeb, :view
  alias GwiaWeb.IdentityView

  def render("index.json", %{identities: identities}) do
    %{data: render_many(identities, IdentityView, "identity.json")}
  end

  def render("show.json", %{identity: identity}) do
    %{data: render_one(identity, IdentityView, "identity.json")}
  end

  def render("identity.json", %{identity: identity}) do
    %{
      id: identity.id,
      value: identity.value,
      name: identity.name
    }
  end
end
