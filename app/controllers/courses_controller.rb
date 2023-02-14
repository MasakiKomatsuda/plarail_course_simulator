class CoursesController < ApplicationController
  def index
    @courses = Course.all.includes(:user).order(created_at: :desc)
  end
end
