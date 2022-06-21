class AddVerificationsCountToParticipant < ActiveRecord::Migration[6.1]
  def change
    add_column(:participants, :verifications_count, :integer)
  end
end
