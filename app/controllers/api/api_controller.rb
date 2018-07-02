module Api
    class ApiController < ApplicationController
      skip_before_action :verify_authenticity_token
        before_action :authenticate

      def authenticate
        authenticate_or_request_with_http_basic do |user, password |
            user == "sahil" &&  password == "password"
        end
      end
    end
end