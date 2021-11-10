module Admin

  class BaseController < ApplicationController
    http_basic_authenticate_with name: ENV["Auth_UserName"], password: ENV["Auth_Password"],if: -> { ENV["Auth_Password"].present? }
  end

end