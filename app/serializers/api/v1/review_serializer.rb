class Api::V1::ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at

  belongs_to :user, key: :author
end
