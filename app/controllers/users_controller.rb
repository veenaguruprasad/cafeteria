class UsersController < ApplicationController
  # skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    user = User.new(name: name, email: email, password: password)
    session[:current_user_id] = user.id
    if user.save
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
