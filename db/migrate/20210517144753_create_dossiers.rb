class CreateDossiers < ActiveRecord::Migration[6.1]
  def change
    create_table :dossiers do |t|
      t.references :affiliation, index: true, foreign_key: { to_table: :affiliations }
      t.references :candidate, index: true, foreign_key: { to_table: :people }
      t.references :primary_expert, index: true, foreign_key: { to_table: :people }
      t.references :secondary_expert, index: true, foreign_key: { to_table: :people }
      t.references :company_contact, index: true, foreign_key: { to_table: :people }
      t.string :company_points_a
      t.string :company_points_b
      t.string :company_mark_a
      t.string :company_mark_b
      t.string :expert_points_a
      t.string :expert_points_b
      t.string :expert_points_c
      t.string :expert_mark_a
      t.string :expert_mark_b
      t.string :expert_mark_c
      t.boolean :mark_deduction
      t.string :final_mark
      t.string :submitted_mark

      t.timestamps
    end
  end
end
