defmodule PhxTest.Repo.Migrations.CreatePhxTest.Account.Post do
  use Ecto.Migration

  def change do
    create table(:post) do
      add :filename, :string
      add :content_type, :string
      add :path, :string

      timestamps()
    end

  end
end
