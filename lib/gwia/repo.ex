defmodule Gwia.Repo do
  use Ecto.Repo,
    otp_app: :gwia,
    adapter: Ecto.Adapters.Postgres
end
