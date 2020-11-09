class AddPostOwnerToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :post_owner, :string
  end
end
