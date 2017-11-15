class AddPasswordsaltToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :passwordsalt, :string
  end
end
