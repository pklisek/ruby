class Picture < ApplicationRecord
  belongs_to :article
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader
end
