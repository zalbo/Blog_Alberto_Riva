class AddWorkIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :work_id, :integer
  end
end
