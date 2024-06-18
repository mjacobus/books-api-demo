module RequestSpecHelper
  extend ActiveSupport::Concern

  included do
    let(:access_token) { 'the-access-token' }
    let(:current_user) { FactoryBot.create(:user, access_token: access_token) }
    let(:parsed_response) { JSON.parse(response.body).with_indifferent_access }
  end

  def get(url, as: nil, **options)
    as ||= current_user

    if as
      options[:headers] ||= {}
      options[:headers]['Authorization'] = "Bearer #{as.access_token}"
    end

    super(url, **options)
  end
end
