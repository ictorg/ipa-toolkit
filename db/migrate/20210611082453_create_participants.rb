class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
