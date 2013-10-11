class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, foreign_key: :author_id

  def has_twitter?
    twitter_handle.present?
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def to_param
    full_name.parameterize
  end

  def self.from_param(param)
    all.find { |user| user.full_name.parameterize == param }
  end

end
