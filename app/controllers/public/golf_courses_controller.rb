class Public::GolfCoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @golf_courses = GolfCourse.all
    
  end

  def show
    @golf_course = GolfCourse.find(params[:id])
    @comment = Comment.new
  end

  def new
    @golf_course = GolfCourse.new
  end

  def create
    @golf_course = current_user.golf_courses.build(golf_course_params)

    if @golf_course.save
      flash[:notice] = "登録しました"
      redirect_to @golf_course
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    @golf_course = GolfCourse.find(params[:id])
  end

  def update
    @golf_course = GolfCourse.find(params[:id])

    if @golf_course.update(golf_course_params)
      flash[:notice] = "編集しました"
      redirect_to @golf_course
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @golf_course = GolfCourse.find(params[:id])
    @golf_course.destroy
    flash[:notice] = "削除しました"
    redirect_to golf_courses_path
  end

  private

  def golf_course_params
    params.require(:golf_course).permit(:name, :caption, :body, :address, :latitude, :longitude, :star, :image)
  end

  def correct_user
    @golf_course = current_user.golf_courses.find_by_id(params[:id])
    redirect_to root_path unless @golf_course
  end
end

