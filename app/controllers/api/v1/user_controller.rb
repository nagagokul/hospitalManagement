class Api::V1::UserController < ApplicationController
    #skip_before_action  :verify_authenticity_token
    before_action :doorkeeper_authorize!
    respond_to :json

    def index
        render json: current_user.as_json(except: :password_digest), status: 201
    end

    private
    def current_user
        @current_user = User.find(doorkeeper_token.resource_owner_id)
        
    end
end