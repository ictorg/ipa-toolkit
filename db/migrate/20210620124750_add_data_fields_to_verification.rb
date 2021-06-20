class AddDataFieldsToVerification < ActiveRecord::Migration[6.1]
  def change
    add_column(:verifications, :changes, :boolean)
    add_column(:verifications, :comment, :string)
    add_column(:verifications, :verified_at, :datetime, precision: 6)
  end
end
