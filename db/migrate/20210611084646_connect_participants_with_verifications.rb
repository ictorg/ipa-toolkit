class ConnectParticipantsWithVerifications < ActiveRecord::Migration[6.1]
  def change
    remove_column(:participants, :email)
  end
end
