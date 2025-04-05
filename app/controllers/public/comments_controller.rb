class  Public::CommentsController < ApplicationController
  def create
    golf_course = GolfCourse.find(params[:golf_course_id])
    comment = current_user.comments.new(comment_params)
    comment.golf_course_id = golf_course.id
    comment.save
    redirect_to golf_course_path(golf_course)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to golf_course_path(params[:golf_course_id])
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

