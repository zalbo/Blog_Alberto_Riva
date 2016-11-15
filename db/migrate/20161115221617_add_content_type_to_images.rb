class AddContentTypeToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_content_type, :text
  end
end
