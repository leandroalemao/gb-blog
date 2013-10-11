class UserPresenter < RailsPresenter::Base

  def self.model_name
    User.model_name
  end

  def photo
    h.image_tag "authors/#{photo_name}.png"
  end

  def twitter_url
    "https://twitter.com/#{twitter_handle}"
  end

  private

  def photo_name
    full_name.downcase.parameterize.underscore
  end

end
