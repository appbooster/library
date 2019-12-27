class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end

  def filename
    if original_filename.present?
      token = Digest::MD5.hexdigest(original_filename)
      "#{token}.#{file.extension}"
    else
      super
    end
  end
end
