# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumb do
    process resize_to_limit: [60, 60]
  end

  version :middle do
    process resize_to_limit: [100, 100]
  end

  version :large do
    process resize_to_limit: [250, 250]
  end
end
