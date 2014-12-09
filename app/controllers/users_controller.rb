class UsersController < ApplicationController
    def show
        unless User.find_by_username(params[:username]) 
            redirect_to('/', flash: {error:"#{params[:username]} is not a known user"})
        end
        @User = User.find_by_username(params[:username])
    end
end