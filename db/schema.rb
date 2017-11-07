# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171027192918) do

  create_table "courses", primary_key: "COURSE_ID", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "COURSE_NAME", limit: 40, null: false
    t.text "COURSE_DESC", null: false
    t.string "INSTRUCTOR_NAME", limit: 50, null: false
    t.integer "CREDIT_HOURS", null: false
    t.integer "Department_ID", null: false
    t.index ["Department_ID"], name: "Department_ID"
  end

  create_table "departments", primary_key: "department_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "department_name", limit: 30, null: false
    t.text "department_desc", null: false
  end

  create_table "students", primary_key: "STUDENT_ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "USERNAME", limit: 40, null: false
    t.text "PASSWORD", null: false
    t.string "EMAIL", limit: 50, null: false
    t.date "REGDATE", null: false
    t.integer "Department_ID", null: false
    t.index ["Department_ID"], name: "Department_ID"
  end

  add_foreign_key "courses", "departments", column: "Department_ID", primary_key: "department_id", name: "courses_ibfk_1"
  add_foreign_key "students", "departments", column: "Department_ID", primary_key: "department_id", name: "students_ibfk_1"
end
