class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :golf_course, foreign_key: true, null: false
      t.text "body"
      t.timestamps
    end
  end
end
