class Uploader < CarrierWave::Uploader::Base
  storage :file
  include CarrierWave::MiniMagick

  process :resize_to_fit => [600, 600]

  def store_dir
    'images'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process :resize_to_fit => [200,200]
  end
end