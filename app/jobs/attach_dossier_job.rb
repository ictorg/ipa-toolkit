# frozen_string_literal: true

class AttachDossierJob < ApplicationJob
  queue_as :default

  def perform(dossier_id, dossier_path, session_token, user_agent)
    dossier = Dossier.find(dossier_id)

    dossier_file = Down.download(
      dossier_path,
      headers: {
        'Cookie' => "#{Settings.pkorg.cookies.session_token}=#{session_token}",
        'User-Agent' => user_agent
      }
    )

    dossier.dossier_file.attach(io: dossier_file, filename: "#{dossier.candidate_id}.zip")
  end
end
