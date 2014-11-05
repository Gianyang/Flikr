class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  permissions 0777

  process :resize_to_fit => [500, 500]

  version :thumb do
    process resize_to_fit: [300, 300]
  end

end
