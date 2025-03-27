class Public::HomesController < ApplicationController
  def top
    redirect_to golf_courses_path if user_signed_in?
  end

  def about
  end
      
end
