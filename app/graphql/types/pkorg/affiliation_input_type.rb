module Types
  class Pkorg::AffiliationInputType < Types::BaseInputObject
    argument :role, String, required: true
    argument :tenant_name, String, required: true
    argument :tenant_id, ID, required: true
  end
end