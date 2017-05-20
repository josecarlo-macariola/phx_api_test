defmodule PhxTest.Repo.Migrations.CreatePhxTest.Blog.UserPost do
  use Ecto.Migration

  def change do
     create table(:user_post) do

       add :post_id, references(:post)
       add :user_id, references(:users)

       timestamps()
     end

     create unique_index(:user_post, [:post_id, :user_id])

   end

end
