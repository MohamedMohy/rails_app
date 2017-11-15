class AddPasswordSaltToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :password_salt, :string
  end
end
