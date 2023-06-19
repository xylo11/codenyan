require 'rails_helper'

RSpec.describe 'UserProfiles', type: :request do
  describe 'GET /edit' do
    it 'returns http success' do
      get '/user_profiles/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/user_profiles/update'
      expect(response).to have_http_status(:success)
    end
  end
end
