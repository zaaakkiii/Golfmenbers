class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end
end
