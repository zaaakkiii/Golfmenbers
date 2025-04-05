class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    golf_courese = GolfCourse.find(params[:golf_course_id])
    current_user.favorite(golf_courese)
    redirect_back(fallback_location: root_url)
  end

  def destroy
    golf_courese = GolfCourse.find(params[:golf_course_id])
    current_user.unfavorite(golf_courese)
    redirect_back(fallback_location: root_url)
  end
end
