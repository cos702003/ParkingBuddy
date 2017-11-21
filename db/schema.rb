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

ActiveRecord::Schema.define(version: 20171119223341) do

  create_table "CamList", primary_key: "Cam_ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "Cam_Name", limit: 10
    t.string "Video_Type", limit: 3
    t.string "Resolution", limit: 9
    t.integer "Frame_Per_Second"
    t.integer "L_ID"
    t.index ["L_ID"], name: "L_ID_idx"
  end

  create_table "Count_Log", primary_key: "Log_ID", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "TimeStamp"
    t.integer "Count"
    t.integer "Lot_ID"
    t.integer "Cam_ID"
    t.index ["Cam_ID"], name: "Cam_ID_idx"
    t.index ["Log_ID"], name: "Log_ID_UNIQUE", unique: true
    t.index ["Lot_ID"], name: "Lot_ID_idx"
  end

  create_table "LotList", primary_key: ["Lot_ID", "File"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "Lot_ID", null: false
    t.string "Lot_Name", limit: 25
    t.integer "Capacity"
    t.string "Space_Type", limit: 20
    t.string "Space_Position", limit: 7
    t.binary "Lot_Template"
    t.string "Address", limit: 25
    t.string "City", limit: 25
    t.integer "ZipCode"
    t.string "File", limit: 45, null: false
  end

  create_table "Users", primary_key: "user_ID", id: :string, limit: 15, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 10
    t.datetime "access_Time"
    t.string "role", limit: 5
  end

  create_table "car_counts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "CamList", "LotList", column: "L_ID", primary_key: "Lot_ID", name: "L_ID", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Count_Log", "CamList", column: "Cam_ID", primary_key: "Cam_ID", name: "Cam_ID", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Count_Log", "LotList", column: "Lot_ID", primary_key: "Lot_ID", name: "Lot_ID", on_update: :cascade, on_delete: :cascade
end
