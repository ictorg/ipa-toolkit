# frozen_string_literal: true

class VerificationMailer < ApplicationMailer
  def invite
    @verification = params[:verification]
    @dossier = @verification.dossier

    @base_path = Rails.env.development? ? 'http' : 'https'
    @base_path += "://#{ENV.fetch('API_ORIGIN', 'localhost:3000')}"

    mail(to: @verification.participant.email, subject: "IPA Toolkit: Einladung zur Verifizierung")
  end
end
