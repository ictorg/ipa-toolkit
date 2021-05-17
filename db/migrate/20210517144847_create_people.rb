class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :forename
      t.string :surname

      t.timestamps
    end
  end
end
