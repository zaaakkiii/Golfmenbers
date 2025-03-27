class Public::GolfCoursesController < ApplicationController
  def index
  end

  def show
    @golf_course = GolfCourse.find(params[:id])
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
  end

  def update
  end

  def destroy
  end

  private

  def golf_course_params
    params.require(:golf_course).permit(:name, :caption, :body, :addres, :latitude, :longitude, :star)
  end
end

