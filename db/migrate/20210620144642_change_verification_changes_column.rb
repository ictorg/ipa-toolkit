class ChangeVerificationChangesColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column(:verifications, :changes, :change_grading)
  end
end
