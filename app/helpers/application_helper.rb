module ApplicationHelper

	# def mark_required(object, attribute)
	#   "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
	# end

	def has_any_errors(object)
		test = ""
		if object.errors.any?
			object.errors.full_messages.each do |msg|
		    	test += msg.to_s + " "
		    end 
		    return test
		end
		return false
	end
end
