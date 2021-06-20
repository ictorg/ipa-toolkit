class VerificationController < ApplicationController
  def download
    if request.headers['X-Token'].nil? || request.headers['X-Password'].nil? 
      return render status: :not_found
    end
    verification = Verification.find_by(token: request.headers['X-Token'])

    if verification.nil? || verification.dossier.conference.password != request.headers['X-Password']
      render status: :not_found
    else
      file = verification.dossier.dossier_file
      send_data file.download, filename: file.filename.to_s, content_type: file.content_type
    end
  end
end
