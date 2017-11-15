class AddPasswordHashToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :password_hash, :string
  end
end
