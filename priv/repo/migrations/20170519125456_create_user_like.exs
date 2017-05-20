defmodule PhxTest.Repo.Migrations.CreatePhxTest.Blog.Like do
  use Ecto.Migration

  def change do
     create table(:user_like) do

       add :post_id, references(:post)
       add :user_id, references(:users)

       timestamps()
     end

     create unique_index(:user_like, [:post_id, :user_id])

   end

end
