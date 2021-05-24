module Types
  class Pkorg::AffiliationInputType < Types::BaseInputObject
    argument :id, Int, required: true
    argument :tenant_name, String, required: true
  end
end