require 'faraday'

class Pkorg::SessionUserService < ApplicationService
  def initialize(session_token, base_url, user_agent)
    @session_token = session_token
    @base_url = base_url
    @user_agent = user_agent
  end

  def retrieve
    response = Faraday.get(URI.join(@base_url, Settings.pkorg.endpoints.session_user)) do |request|
      request.headers['Cookie'] = "#{Settings.pkorg.cookies.session_token}=#{@session_token}"
      request.headers['User-Agent'] = @user_agent
    end
    parsedResponse = JSON.parse(response.body)
    {
      'email': parsedResponse["person"]["clogin"],
      'forename': parsedResponse["person"]["cvorname"],
      'surname': parsedResponse["person"]["cnachname"]
    }
  end
end