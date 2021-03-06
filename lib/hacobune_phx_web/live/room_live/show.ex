defmodule HacobunePhxWeb.RoomLive.Show do
  use HacobunePhxWeb, :live_view

  alias HacobunePhx.Rooms
  alias HacobunePhx.Rooms.Message

  @impl true
  def mount(%{"id" => id}, session, socket) do
    if connected?(socket), do: Rooms.subscribe(id)

    user = HacobunePhx.Accounts.get_user_by_session_token(session["user_token"])
    room = Rooms.get_room_with_messages!(id)
    changeset = Rooms.change_message(%Message{user_id: user.id, room_id: room.id})

    {:ok,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:room, room)
     |> assign(:messages, room.messages)
     |> assign(:changeset, changeset)
     |> assign(:user, user)
     |> assign(:session_id, session["live_socket_id"]), temporary_assigns: [messages: []]}
  end

  @impl true
  def handle_event("save", %{"message" => message_params}, socket) do
    case Rooms.create_message(message_params) do
      {:ok, message} ->
        changeset =
          Rooms.change_message(%Message{user_id: message.user_id, room_id: message.room_id})

        socket = assign(socket, changeset: changeset)
        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  @impl true
  def handle_info({:message_created, message}, socket) do
    socket = update(socket, :messages, fn messages -> [message | messages] end)

    {:noreply, socket}
  end

  defp page_title(:show), do: "Show Room"
end
