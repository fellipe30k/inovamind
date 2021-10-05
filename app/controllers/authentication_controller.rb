class AuthenticationController < ApplicationController
    def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])
        
        if command.success?
            render json: { token: command.result }, status: :ok
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end
end
