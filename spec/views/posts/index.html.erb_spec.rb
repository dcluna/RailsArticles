require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post, :pub_date => 1.days.ago),
      stub_model(Post, :pub_date => 2.days.ago)
    ])
  end

  it "renders a list of posts" do
    render
  end
end
