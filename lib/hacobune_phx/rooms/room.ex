defmodule HacobunePhx.Rooms.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :description, :string
    field :name, :string
    belongs_to :user, HacobunePhx.Accounts.User
    has_many :messages, HacobunePhx.Rooms.Message

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :description, :user_id])
    |> validate_required([:name, :user_id])
  end
end
