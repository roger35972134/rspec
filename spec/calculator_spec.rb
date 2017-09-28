require 'rails_helper'

describe "calculator" do

	let(:caculator){Caculator.new}

	it "adds numbers" do
 		expect(caculator.add(2, 3)).to eql(5)
 	end

 	it "substrats numbers" do
 		expect(caculator.subtract(5, 1)).to eql(4)
 	end

 	it "adds numbers boolean" do
 		expect(caculator.add(2, 3) == 5).to be true
 	end
end
