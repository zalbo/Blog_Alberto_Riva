class AddTitleToWorks < ActiveRecord::Migration
  def change
    add_column :works, :title, :string
    add_column :works, :description, :text
  end
end
