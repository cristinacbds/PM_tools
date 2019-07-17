class AddProductIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :product_id, :integer
  end
end
