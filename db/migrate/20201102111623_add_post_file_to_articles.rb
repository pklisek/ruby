class AddPostFileToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :post_file, :string
  end
end
