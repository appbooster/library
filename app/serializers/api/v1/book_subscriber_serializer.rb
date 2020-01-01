class Api::V1::BookSubscriberSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name

  attribute :created_at, key: :subscribed_at

  def id
    subscriber.id
  end

  def email
    subscriber.email
  end

  def full_name
    "#{subscriber.last_name} #{subscriber.first_name}"
  end

  def subscriber
    @subscriber ||= object.user
  end
end
