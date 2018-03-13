defmodule ReadingList.ReadingList.Media do
  use Ecto.Schema
  import Ecto.Changeset


  schema "media" do
    field :author, :string
    field :description, :string
    field :link, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [:title, :author, :description, :link])
    |> validate_required([:title, :author, :description, :link])
  end
end
