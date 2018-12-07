class SessionnsController < ApplicationController
    def new

    end 
    
    def create
        user = User.find_by(email: params[:sessionx][:email].downcase)
        if user && user.authenticate(params[:sessionx][:password])
        session[:user_id] = user.id
        flash[:success] = "You Have Successfully logged in"
        redirect_to user_path(user)
        else
            flash.now[:danger] = "Email or Password wrong"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end
end