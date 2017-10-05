require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	
	# before(:all) do
	# 	post_1 = Post.create(:title => "title_1", :content => "content_1")
	# 	post_2 = Post.create(:title => "title_2", :content => "content_2")
	# end

	post_1 = FactoryGirl.create :post_1
	post_2 = FactoryGirl.create :post_2
	# let(:post_1) { Post.create(:title => "title_1", :content => "content_1") }
	#let(:post_2) { Post.create(:title => "title_2", :content => "content_2") }

	it "#index" do
		get :index
		expect(response).to have_http_status(200)
		expect(response).to render_template(:index)
	end

	it "#new" do
		get :new
		expect(response).to have_http_status(200)
		expect(response).to render_template(:new)
	end
	
	it "#edit" do
		get :edit, id: post_1[:id]
		expect(post_1.title).to eql "title_1"
		expect(response).to have_http_status(200)
		expect(response).to render_template(:edit)
	end

	describe "#create" do
		before(:all) do
			@post_params = {:title => "title", :content => "content"}
		end

		it "create record" do
			expect { post :create, post: @post_params }.to change{Post.all.size}.by(1)
		end

		it "redirect on success" do 
			post :create, post: @post_params
			expect(response).to have_http_status(302)
			expect(response).to redirect_to(post_path(Post.last))
		end

		it "render :new on fail" do 
			allow_any_instance_of(Post).to receive(:save).and_return(false)
			post :create, post: @post_params
			expect(response).not_to have_http_status(302)
			expect(response).to render_template(:new)
		end
	end

	describe "#update" do
		# before(:all) do
		# 	@post_params = {:title => "title_3", :content => "content"}
		# end

		let(:post_params) { {:title => "title_3", :content => "content"} }

		it "change record" do
			post :update, post: post_params , id: post_2[:id]
			expect(Post.find(post_2[:id])[:title]).to eql("title_3")
		end

		it "redirect on success" do 
			post :update, post: post_params , id: post_2[:id]
			expect(response).to have_http_status(302)
			expect(response).to redirect_to(post_path(Post.find(post_2[:id])))
		end

		it "render :edit on fail" do 
			allow_any_instance_of(Post).to receive(:update).and_return(false)
			post :update, post: post_params , id: post_2[:id]
			expect(response).not_to have_http_status(302)
			expect(response).to render_template(:edit)
		end
	end

	describe "#destroy" do 
		
		before(:each) do
			@post_3 = post_2 || Post.create(title: "title_3", content: "content_3")
		end

		# subject(:post_3) { (post_2 || Post.create(title: "title_3", content: "content_3")) }


		it "destroy record" do
			expect{delete :destroy, id: @post_3[:id]}.to change{Post.all.count}.by(-1)
			# can't use subject or let, because this will made Post.all.count changing by (0)
		end

		it "redirect to index after destroy" do
			delete :destroy, id: @post_3[:id]
			expect(response).to have_http_status(302)
			expect(response).to redirect_to(posts_path)
		end
	end
end