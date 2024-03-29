class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, as: :author

  def has_twitter?
    twitter_handle.present?
  end

  def name
    "#{first_name} #{last_name}"
  end
end
