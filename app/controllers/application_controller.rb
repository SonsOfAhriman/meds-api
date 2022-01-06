class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :authenticate_user!

  # skip_before_action :verify_authenticity_token, :only => :create


  # include Pundit

  # acts_as_token_authentication_handler_for User



end
