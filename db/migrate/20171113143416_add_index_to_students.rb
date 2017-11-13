class AddIndexToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :EMAIL, :string
    add_index :students, :EMAIL, unique: true
  end
end
