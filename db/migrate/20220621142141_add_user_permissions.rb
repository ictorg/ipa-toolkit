class AddUserPermissions < ActiveRecord::Migration[6.1]
  def change
    add_column(:users, :superuser, :boolean)

    admin = User.first
    admin.superuser = true
    admin.save!

    create_table :permissions do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :conference, index: true, foreign_key: { to_table: :conferences }
      t.timestamps
    end
  end
end
