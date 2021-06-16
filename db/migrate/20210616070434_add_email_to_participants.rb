class AddEmailToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column(:participants, :email, :string, null: false)
  end
end
