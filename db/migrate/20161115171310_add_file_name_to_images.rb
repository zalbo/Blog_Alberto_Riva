class AddFileNameToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_file_name, :string
  end
end
