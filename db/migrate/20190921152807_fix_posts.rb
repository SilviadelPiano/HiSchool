class FixPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :school_class_id, :bigint
    change_column_null :posts, :description, false, default: ""
  end
end
