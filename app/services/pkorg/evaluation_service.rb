require 'faraday'

class Pkorg::EvaluationService < ApplicationService
  def initialize(session_token, base_url, user_agent, evaluation_path)
    super()
    @session_token = session_token
    @base_url = base_url
    @user_agent = user_agent
    @evaluation_path = evaluation_path
  end

  def retrieve
    response = Faraday.get(URI.join(@base_url, @evaluation_path)) do |request|
      request.headers['Cookie'] = "#{Settings.pkorg.cookies.session_token}=#{@session_token}"
      request.headers['User-Agent'] = @user_agent
    end
    {
      'result': response.body
    }
  end
end