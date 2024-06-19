require 'rails_helper'

RSpec.describe 'Api::V1::Authors', type: :request do
  describe 'GET #index' do
    let(:current_user) { FactoryBot.create(:user) }
    let(:perform_request) { get '/api/v1/authors', as: current_user, params: { per_page: 2, page: 1 } }
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

    it 'handles with the correct handler' do
      handler_class = Api::V1::Authors::IndexRequestHandler

      allow(handler_class).to receive(:new).and_call_original

      perform_request

      expect(handler_class).to have_received(:new).with(current_user:)
    end

    it 'propertly instanciates request' do
      request_class = Api::V1::Authors::IndexRequest

      allow(request_class).to receive(:new).and_call_original

      perform_request

      expect(request_class).to have_received(:new).with(per_page: 2.to_s, page: 1.to_s)
    end
  end
end
