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
  end
end
