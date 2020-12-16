class ApplicationController < ActionController::Base
  before_action :congfigure_permitted_parameters, if: :devise_controller?

  private

  def congfigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
