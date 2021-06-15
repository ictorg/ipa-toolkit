# frozen_string_literal: true

module Mutations
  class ConferenceMutationType < Types::BaseObject
    field :createConference, mutation: Conference::CreateConferenceMutation
    field :updateConference, mutation: Conference::UpdateConferenceMutation
  end

  class ConferenceMutation < BaseMutation
    type ConferenceMutationType

    def resolve
      {}
    end
  end
end
