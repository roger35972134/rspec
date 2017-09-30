class Post < ActiveRecord::Base
	has_many :comments
	validates :title, :presence => true

	def self.no_content
		where(:content => nil)
	end

	def abstract
		self.content[0..20]
	end
end
