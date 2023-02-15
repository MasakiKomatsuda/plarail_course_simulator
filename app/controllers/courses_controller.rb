class CoursesController < ApplicationController
  def index
    @courses = Course.all.includes(:user).order(created_at: :desc)
  end


  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to courses_path, success: t('defaults.message.created')
    else
      flash.now['danger'] = t('defaults.message.not_created')
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end


  private

  def course_params
    params.require(:course).permit(:title, :description)
  end
end
