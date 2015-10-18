# encoding: utf-8

class JumbotronUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :tags => ['jumbotron_image']

  version :thumbnail do
    process convert: 'jpg'
    resize_to_fit(800, 150)
  end

  version :widescreen do
    process convert: 'jpg'
    process resize_to_fill: [2560, 480]
  end
end
