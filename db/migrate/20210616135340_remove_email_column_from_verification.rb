class RemoveEmailColumnFromVerification < ActiveRecord::Migration[6.1]
  def change
    remove_column(:verifications, :email)
  end
end
