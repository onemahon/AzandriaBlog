class UploadedImage < ActiveRecord::Base
  mount_uploader :image, UploadedImageUploader

  validates :alt_text, presence: true
  validates :image, presence: true

  def self.params
    [
        :alt_text,
        :image,
        :tags
    ]
  end
end
