class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fb_uid, null: false
      t.integer  "status", default: 0, null: false
      t.index ["fb_uid"], name: "index_users_on_fb_uid", unique: true, using: :btree
      t.timestamps
    end
  end
end
