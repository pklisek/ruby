class AddPictureToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :picture, :string
  end
end
