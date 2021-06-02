# frozen_string_literal: true

class VerificationMailer < ApplicationMailer
  def invite
    verification = params[:verification]
    @dossier = verification.dossier
    mail(to: verification.email, subject: 'Einladung zur Verifizierung')
  end
end
