class Public::UsersController < ApplicationController
  def guest_login
    @user = User.guest
    sign_in(@user)
    redirect_to root_path
   end
   before_action :is_matching_login_user, only: [:edit, :update]
  def show 
    @user = User.find(params[:id])
    @golf_courses = @user.golf_courses
  end
  
  def edit
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to @golf_course
    end
  end
end
