module Types
  class Pkorg::PersonInputType < Types::BaseInputObject
    argument :id, Int, required: true
    argument :forename, String, required: true
    argument :surname, String, required: true
  end
end
