class Note < ApplicationRecord
  validates :title, :image, :content, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
end
