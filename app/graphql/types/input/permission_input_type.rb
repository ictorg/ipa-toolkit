# frozen_string_literal: true

module Types
  module Input
    class PermissionInputType < Types::BaseInputObject
      argument :id, Int, required: false
      argument :conference_id, Int, required: true
      argument :user_id, Int, required: true
    end
  end
end
