defmodule Discuss.Discussions.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:content, :user]}

  schema "comments" do
    field :content, :string

    belongs_to :user, Discuss.Auth.User
    belongs_to :topic, Discuss.Discussions.Topic

    timestamps()
  end

  def changeset(topic, attrs \\ %{}) do
    topic
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
