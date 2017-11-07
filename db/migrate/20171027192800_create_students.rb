class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    if !table_exists?('students')
          create_table :students do |t|
            t.timestamps
    end
   end
  end
end
