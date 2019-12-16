class UsersController < ApplicationController
  def index
    @users = User.all.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(current_user.id)
  end

  def create
    @user = User.new(params_user)
    if @user.save
      begin
        #ConfirmationMailer.confirm_email("#{@user.email}",
        #@user.activation_token).deliver
      rescue
        flash[:notice] = "activation instruction fails send to your email"
      end
      flash[:notice] = "activation instruction has send to #{@user.email}"
      redirect_to root_url
    else
      flash[:error] = "data not valid"
      render "new"
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(params_user)
      flash[:success] = "Success Update Job"
      redirect_to root_path
    else
      flash[:error] = "Data invalid"
      render 'edit'
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  private
  def params_user
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :humanizer_answer, :humanizer_question_id, :age, :role, :first_name, :last_name, :experience_status, :attachment)
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if @user.destroy
        flash[:success] = "Success Delete User"
        redirect_to action: "index"
    else
        flash[:success] = "Success Delete Records"
        redirect_to action: "index"
    end
  end
end
