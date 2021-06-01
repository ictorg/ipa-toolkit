# frozen_string_literal: true

class CreateVerifications < ActiveRecord::Migration[6.1]
  def change
    create_table :verifications do |t|
      t.references :dossier, index: true, foreign_key: { to_table: :dossiers }
      t.string :email
      t.timestamps
    end
  end
end
