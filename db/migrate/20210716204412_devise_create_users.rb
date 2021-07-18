# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.string :username, null: false
      t.string :full_name, null: false
      t.string :photo
      t.string :cover_image

      t.timestamps null: false
    end

    add_index :users, :username,             unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
