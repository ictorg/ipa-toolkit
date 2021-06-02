# frozen_string_literal: true

class VerificationMailer < ApplicationMailer
  def invite
    verification = params[:verification]
    mail(to: verification.email, subject: 'Invitation')
  end
end
