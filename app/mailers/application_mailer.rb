# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  append_view_path Rails.root.join('app/views/mailers')
  default from: "\"IPA Toolkit\" <#{ENV['SYSTEM_EMAIL_ADDRESS']}>"
  layout 'mailer'
end
