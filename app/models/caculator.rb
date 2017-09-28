class Caculator < ActiveRecord::Base
	def add(x, y)
    	x + y
  	end

  	def subtract(x, y)
  		x - y
  	end

end
