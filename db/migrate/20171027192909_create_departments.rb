class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
      if !table_exists?('departments')
        create_table :departments do |t|
          t.timestamps
    end
   end
  end
end
