class AvatarUploader < ImageUploader
  version :thumb, from_version: :standard do
    process resize_to_fit: [80, 80]
  end
end
