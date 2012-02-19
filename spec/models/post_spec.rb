require 'spec_helper'

describe Post do
  before(:each) do
    @post = Post.new(:title => "Title", :body => "Body", :author => "Author", :pub_date => 2.days.ago, :status => :draft)
  end
  
  it "can be instantiated" do
    Post.new.should be_an_instance_of(Post)
  end

  it "can be saved successfully" do
    @post.save
    @post.should be_persisted
    @post.delete
  end

  it "can be deleted" do
    @post.delete.should be_true
  end
end
