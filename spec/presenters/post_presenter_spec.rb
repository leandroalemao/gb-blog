require 'spec_helper'

describe PostPresenter do

  context "#publish_date" do
    it "returns nothing if post is not published" do
      post_presenter = PostPresenter.new(build(:post), view)

      post_presenter.publish_date.should be_nil
    end
  end

  context "#form_method" do
    it "uses POST for new records" do
      post_presenter = PostPresenter.new(build(:post), view)

      post_presenter.form_method.should eq :post
    end

    it "uses PATCH for new records" do
      post_presenter = PostPresenter.new(create(:post), view)

      post_presenter.form_method.should eq :patch
    end
  end

  context "#description" do
    it "returns the body without html tags" do
      post_presenter = PostPresenter.new(create(:post, body: '# title'), view)

      post_presenter.description.should eq 'title'
    end

    it "removes new lines" do
      post_presenter = PostPresenter.new(create(:post, body: "title.\n\ntext"), view)

      post_presenter.description.should eq 'title. text'
    end
  end

end
