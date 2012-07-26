class Help # < ActiveRecord::Base

	attr_accessor :counter
#  attr_accessible :counter


	def self.has_any_errors(object)
		test = ""
		if object.errors.any?
			object.errors.full_messages.each do |msg|
		    	test += msg.to_s + " "
		    end 
		    return test
		end
		return test
	end
end
