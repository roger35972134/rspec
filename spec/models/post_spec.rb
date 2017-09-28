require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is accessable" do 
  	post = Post.create
  	expect(post).to eql(Post.last)
  end

  it "has title and content columns" do 
  	columns = Post.column_names

  	expect(columns).to include("id")
  	expect(columns).to include("title")
  	expect(columns).to include("content")
  	expect(columns).not_to include("user")
  end
end
