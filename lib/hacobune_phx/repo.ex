defmodule HacobunePhx.Repo do
  use Ecto.Repo,
    otp_app: :hacobune_phx,
    adapter: Ecto.Adapters.MyXQL
end
