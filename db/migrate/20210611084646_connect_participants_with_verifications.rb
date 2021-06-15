class ConnectParticipantsWithVerifications < ActiveRecord::Migration[6.1]
  def change
    remove_column(:participants, :email)
    add_reference(:verifications, :participant, foreign_key: true)
  end
end
