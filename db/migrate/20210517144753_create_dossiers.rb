class CreateDossiers < ActiveRecord::Migration[6.1]
  def change
    create_table :dossiers do |t|
      t.string :finalMark

      t.timestamps
    end
  end
end
