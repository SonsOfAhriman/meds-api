class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  skip_before_action :verify_authenticity_token, :only => :create


  include Pundit

  acts_as_token_authentication_handler_for User

end
