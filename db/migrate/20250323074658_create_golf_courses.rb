class CreateGolfCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :golf_courses do |t|
      t.string "name"
      t.text "caption"
      t.integer "user_id"
      t.text "body"
      t.string "address"
      t.float "latitude"
      t.float "longitude"
      t.integer "star"
      t.timestamps
    end
  end
end
