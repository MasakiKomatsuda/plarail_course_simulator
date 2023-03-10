class Course < ApplicationRecord
  mount_uploader :image, CourseImageUploader
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 65_535 }
end
