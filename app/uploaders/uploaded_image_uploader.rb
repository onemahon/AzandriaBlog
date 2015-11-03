class UploadedImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process tags: ['uploaded_image']

  version :thumbnail do
    process convert: 'jpg'
    resize_to_fit(800, 150)
  end

  version :medium do
    process convert: 'jpg'
    resize_to_fit(800, 800)
  end
end
