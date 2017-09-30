require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  
  before(:each) do
    @post = Post.create(:title => "Big Title", :content => "content")
  end

  it "render partial" do
    render
    expect(response).to render_template(partial: "posts/_form")
  end

  it "has link" do 
    render
    expect(rendered).to include("Show")
    expect(rendered).to include("Back")
  end
end
