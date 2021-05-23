require 'faraday'

class Pkorg::ImportService < ApplicationService
  def initialize(session_token, base_url, user_agent, dossiers)
    super()
    @session_token = session_token
    @base_url = base_url
    @user_agent = user_agent
    @dossiers = dossiers
  end

  def import
    response = Faraday.get(URI.join(@base_url, @evaluation_path)) do |request|
      request.headers['Cookie'] = "#{Settings.pkorg.cookies.session_token}=#{@session_token}"
      request.headers['User-Agent'] = @user_agent
    end
    debugger
    {
      'result': response.body
    }
  end
end