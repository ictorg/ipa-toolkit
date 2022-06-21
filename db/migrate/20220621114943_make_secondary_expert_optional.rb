class MakeSecondaryExpertOptional < ActiveRecord::Migration[6.1]
  def change
    change_column(:dossiers, :secondary_expert_id, :bigint, null: true)
  end
end
