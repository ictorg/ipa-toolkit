class CreateConferences < ActiveRecord::Migration[6.1]
  def change
    create_table :conferences do |t|
      t.string :password
      t.string :name

      t.timestamps
    end


    add_reference(:participants, :conference, foreign_key: true)
  end
end
