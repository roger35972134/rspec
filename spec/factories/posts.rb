FactoryGirl.define do
  factory :post do
  	title "title"
  	content "content"

  	factory :post_1 do
  		title "title_1"
  		content "content_1"
  	end

  	factory :post_2 do
  		title "title_2"
  		content "content_2"
  	end
  end
end
