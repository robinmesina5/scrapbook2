class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def current_or_guest_user
  # 	if current_or_guest_user
  # 		if session[:guest_user_id] && session[:guest_user_id] != current_user.id
  # 			logging_in
  # 			guest_user(with_retry = false).try(:destroy)
  # 			session[:guest_user_id] = nil
  # 		end
  # 		current_user
  # 	else
  # 		guest_user
  # end
end
