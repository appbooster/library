class Api::V1::ProfileSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name

  def full_name
    "#{object.last_name} #{object.first_name}"
  end
end
