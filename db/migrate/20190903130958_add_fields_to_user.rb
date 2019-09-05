class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :surname, null: false, default: ""
      t.string :birth_place, null: false, default: ""
      t.date :birth_date, null: false, default: Date.today #da vederre se funziona o crea problemi
      t.string :sex, null: false, default: ""
      t.string :CF, null:false, default: ""
    end 

    add_index :users,   :CF, unique: true
  end 
end 
