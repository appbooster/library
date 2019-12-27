class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true, unique: true
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :avatar
      t.string :google_uid, index: true

      t.timestamps
    end
  end
end
