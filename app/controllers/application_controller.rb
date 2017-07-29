class ApplicationController < ActionController::Base
  # Comment added by Srinivas
  protect_from_forgery with: :exception
end
