require 'sinatra/base'
require_relative 'fixtures_helper'

class ChmeetingsMock < Sinatra::Base
  # GET requests
  {
    'people' => :people,
    'families' => :families,
    'families/show' => :family,
    'family-members' => :family_members,
    'groups' => :groups,
    'contributions' => :contributions,
    'contributions/batches' => :batches,
    'contributions/batches/:id' => :batch,
    'pledges' => :pledges,
    'campaigns' => :campaigns
  }.each do |end_point, json|
    get "/api/v1/#{end_point}" do
      json_response 200, "#{json}.json"
    end
  end

  # POST requests
  {
    'people' => :person,
    'people/delete' => :person,
    'contributions/batches' => :batch,
    'families' => :family,
    'families/delete' => :family,
    'family-members' => :family_member,
    'family-members/delete' => :family_member,
    'contributions' => :contribution
  }.each do |end_point, json|
    post "/api/v1/#{end_point}" do
      json_response 200, "#{json}.json"
    end
  end

  # PUT requests
  {
    'people' => :person,
    'families' => :family,
    'family-members' => :family_member,
    'contributions/batches/:id' => :batch
  }.each do |end_point, json|
    put "/api/v1/#{end_point}" do
      json_response 200, "#{json}.json"
    end
  end

  # DELETE requests
  [
    'contributions/batches/:id'
  ].each do |end_point|
    delete "/api/v1/#{end_point}" do
      content_type :json
      status 204
    end
  end

  # PATCH requests
  {
    'family-members' => :family_member
  }.each do |end_point, json|
    patch "/api/v1/#{end_point}" do
      json_response 200, "#{json}.json"
    end
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    FixturesHelper.read(file_name)
  end
end
