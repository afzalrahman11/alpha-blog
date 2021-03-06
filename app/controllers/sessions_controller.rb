class SessionsController < ApplicationController

def new

end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = "You are logged in successfully"
        redirect_to user
    else
        flash.now[:alert] = "Wrong email/password!"
        render 'new'
    end

end

def destroy
    session[:user_id] = nil
    flash[:alert] = "Logged out"
    redirect_to root_path
end

end