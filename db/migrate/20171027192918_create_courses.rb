class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    if !table_exists?('courses')
      create_table :courses do |t|
        t.timestamps
    end
  end
 end
end
