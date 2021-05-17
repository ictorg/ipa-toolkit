require 'faraday'

class Pkorg::SessionUserService < ApplicationService
  def initialize(session_token, base_url, user_agent)
    super()
    @session_token = session_token
    @base_url = base_url
    @user_agent = user_agent
  end

  def retrieve
    response = Faraday.get(URI.join(@base_url, Settings.pkorg.endpoints.session_user)) do |request|
      request.headers['Cookie'] = "#{Settings.pkorg.cookies.session_token}=#{@session_token}"
      request.headers['User-Agent'] = @user_agent
    end
    parsed_response = JSON.parse(response.body)
    {
      'email': parsed_response['person']['clogin'],
      'forename': parsed_response['person']['cvorname'],
      'surname': parsed_response['person']['cnachname'],
      'affiliations': map_affiliations(parsed_response['affiliations'])
    }
  end

  private

  def map_affiliations(affiliations)
    affiliations['all'].map do |role|
      {
        'role': role['role'],
        'tenant_name': role['client'],
        'tenant_id': role['nmandantid']
      }
    end
  end
end