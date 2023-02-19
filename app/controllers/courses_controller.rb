class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy]

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
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to @course, success: t('defaults.message.updated')
    else
      flash.now['danger'] = t('defaults.message.not_updated')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy!
    redirect_to courses_path, success: t('defaults.message.deleted')
  end


  private

  def set_course
    @course = current_user.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :image, :image_cache)
  end
end
