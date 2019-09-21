class AddIdToSchoolClassTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :school_classes_teachers, :id, :primary_key
  end
end
