class Api::V1::BookReaderSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name

  attribute :taken_at, key: :read_since

  def id
    reader.id
  end

  def email
    reader.email
  end

  def full_name
    "#{reader.last_name} #{reader.first_name}"
  end

  def reader
    @reader ||= object.user
  end
end
