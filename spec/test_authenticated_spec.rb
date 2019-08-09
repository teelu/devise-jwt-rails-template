# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'GET /test_authentication', type: :request do
  let(:user) { Fabricate(:user) }
  let(:url) { '/test_authentication' }
  let(:headers) { {'Accept': 'application/json', 'Content-Type': 'application/json'} }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  context 'when headers are correct' do
    before do
      get url, headers: auth_headers
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'when headers are incorrect' do
    before do
      get url, headers: {}
    end

    it 'returns 401' do
      expect(response).to have_http_status(401)
    end
  end
end
