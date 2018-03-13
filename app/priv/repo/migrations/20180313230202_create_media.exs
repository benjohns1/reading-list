defmodule ReadingList.Repo.Migrations.CreateMedia do
  use Ecto.Migration

  def change do
    create table(:media) do
      add :title, :string
      add :author, :string
      add :description, :text
      add :link, :string

      timestamps()
    end

  end
end
