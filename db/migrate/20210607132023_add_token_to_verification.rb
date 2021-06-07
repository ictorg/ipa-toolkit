class AddTokenToVerification < ActiveRecord::Migration[6.1]
  def change
    add_column(:verifications, :token, :string, null: false)
    add_index(:verifications, :token, unique: true)
  end
end
