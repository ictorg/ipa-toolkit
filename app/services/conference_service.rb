# frozen_string_literal: true

class ConferenceService < ApplicationService
  CONFERENCE_MAPPINGS = {
    participants: :participants_attributes
  }.freeze

  def initialize(conference)
    super()
    @conference = conference
  end

  def save
    parsed_conference = @conference.to_h.transform_keys { |key| CONFERENCE_MAPPINGS[key] || key }
    current_conference = Conference.find_or_initialize_by(id: parsed_conference[:id])
    unless parsed_conference[:participants_attributes].nil?
      current_conference.participants = parsed_conference[:participants_attributes].map do |p|
        Participant.find_or_create_by(p)
      end
    end
    current_conference.assign_attributes(parsed_conference)
    current_conference.save!
    current_conference.as_json(include: :participants)
  end
end
