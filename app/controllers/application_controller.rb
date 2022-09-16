class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      if user_signed_in?
        redirect_back fallback_location: root_path
      else
        redirect_to new_user_session_path
      end
    end
end
