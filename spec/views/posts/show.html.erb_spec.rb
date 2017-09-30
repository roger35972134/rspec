require 'rails_helper'

RSpec.describe "posts/show", type: :view do

  it "render 'No Content' when @post has no content" do
    @post = Post.create(:title => "Big Title", :content => nil)
    render
    expect(rendered).to include("No Content")
  end

  it "render content when @post has content" do
    allow(view).to receive(:render_content).and_return("Stub Content")
    @post = Post.create(:title => "Big Title", :content => "I love rails")
    render
    expect(rendered).not_to include("No Content")
    expect(rendered).not_to include("I love rails")
    expect(rendered).to include("Stub Content")
  end

end
