# frozen_string_literal: true

module Types
  module Users
    class UserInputType < Types::BaseInputObject
      argument :id, Int, required: false
      argument :email, String, required: true
      argument :name, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true
      argument :nickname, String, required: false
    end
  end
end
