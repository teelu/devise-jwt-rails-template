class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      render 'registrations/create.json', locals: { resource: resource }
    else
      render json: { errors: resource.errors.full_messages }, status: :bad_request
    end
  end
end
