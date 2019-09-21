class FixPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :school_class_id, :bigint
  end
end
