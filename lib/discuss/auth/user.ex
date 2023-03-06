defmodule Discuss.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string

    has_many :topics, Discuss.Discussions.Topic

    timestamps()
  end

  def changeset(topic, attrs \\ %{}) do
    topic
    |> cast(attrs, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
