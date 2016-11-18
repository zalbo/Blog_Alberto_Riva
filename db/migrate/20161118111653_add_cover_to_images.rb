class AddCoverToImages < ActiveRecord::Migration
  def change
    add_column :images, :cover, :text
  end
end
