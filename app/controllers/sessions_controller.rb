class SessionsController < ApplicationController
    def new
    end

    def create
        username = params[:username]
        password = params[:password]
        user = User.where("username =?", username).first
        user_password = BCrypt::Engine.hash_secret(password, user.password_salt) unless user.blank?
        if !user_password.blank? and user.password_hash.eql? user_password
            session[:user] = user.id
            flash[:notice] = "Welcome #{user.username}"
            if !user.first_name.blank? or !user.last_name.blank? or !user.experience_status.blank? or !user.attachment.blank?
                redirect_to root_path
            else
                redirect_to edit_user_path(current_user.id)
            end
        else
            params[:username]
            flash[:error] = "Your data not valid"
            render "new"
        end
    end
    
    def edit
        user = User.find_by_activation_token(params[:id])
        if user.try(:update,{activation_token: "", activation_status: "active"})
            flash[:notice] = "Your account has active"
            redirect_to root_url
        else
            flash[:notice] = "Welcome to Rails 5"
            redirect_to root_url
        end   
    end

    def destroy
        session[:user] = nil
        flash[:notice] = "logout session success"
        redirect_to root_url
    end

    def show
        @session[:user] = Sessions.find_by_id(params[:id])
    end
end