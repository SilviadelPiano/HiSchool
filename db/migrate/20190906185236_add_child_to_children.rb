class AddChildToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :child_id, :bigint
    add_index :children, :child_id
  end
end
