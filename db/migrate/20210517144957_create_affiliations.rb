class CreateAffiliations < ActiveRecord::Migration[6.1]
  def change
    create_table :affiliations do |t|
      t.string :role
      t.string :tenant_name

      t.timestamps
    end
  end
end
