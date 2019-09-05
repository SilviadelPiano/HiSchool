class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :user
      t.belongs_to :schoolClass
      t.timestamps
    end

    create_table :children do |t|
      t.references :parent
      t.timestamps
    end

    create_table :posts_students, id: false do |t|  # forse questa tabella con le ralative associazioni potrà essere cancellata
      t.bigint :user_id
      t.bigint :post_id
      t.date :submitted_on
    end

    
    create_table :school_classes_teachers, id: false do |t|
      t.bigint :school_class_id
      t.bigint :teacher_id
      t.string :subject  
    end
  
    add_index :school_classes_teachers, :teacher_id
    add_index :school_classes_teachers, :school_class_id
  
    add_index :posts_students, :user_id
    add_index :posts_students, :post_id
  
  end
end
