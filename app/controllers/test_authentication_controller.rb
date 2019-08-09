class TestAuthenticationController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: 'Message Success!' }, status: :ok
  end
end
