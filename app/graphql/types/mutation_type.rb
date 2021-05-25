# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :pkorg, mutation: Mutations::PkorgMutation
  end
end
