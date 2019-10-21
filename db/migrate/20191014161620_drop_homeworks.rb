class DropHomeworks < ActiveRecord::Migration[5.1]
  def change
    remove_index :posts_students, name: :index_posts_students_on_post_id
    remove_index :posts_students, name: :index_posts_students_on_user_id

    drop_table :posts_students

  end
end
