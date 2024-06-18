require 'rails_helper'

RSpec.describe 'Api::V1::Authors', type: :request do
  describe 'GET #index' do
    let(:current_user) { FactoryBot.create(:user) }
    let(:perform_request) { get '/api/v1/authors', as: current_user }
    let(:author) { FactoryBot.create(:author, user: current_user) }

    before do
      author

      FactoryBot.create(:author, user: FactoryBot.create(:user))
    end

    it 'returns responds with 200 status' do
      perform_request

      expect(response).to have_http_status(200)
    end

    it 'returns responds with 200 status' do
      perform_request

      expect(parsed_response[:data].length).to eq(1)
      expect(parsed_response[:data].first[:name]).to eq(author.name)
    end
  end
end
