class CreateAdminUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_users do |t|
      t.string :username
      t.integer :user_id
      t.string :permission
      t.string :status
      t.integer :updated_by
      t.integer :created_by

      t.timestamps
    end


    add_index :admin_users, :username, :name => 'admin_users_username_idx'
    add_index :admin_users, :user_id, :name => 'admin_users_user_id_idx'
    add_index :admin_users, :status, :name => 'admin_users_status_idx'

  end
end
