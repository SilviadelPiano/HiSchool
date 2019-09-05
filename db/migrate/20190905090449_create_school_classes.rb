class CreateSchoolClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :school_classes do |t|
      t.string :name
      t.references :school
      t.timestamps
    end
  end
end
