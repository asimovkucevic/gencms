module RowsHelper

	def is_right_size(index)
		if (index + 1) % 2 == 0 
			return 	"style='clear:both;'"
		end
	end
end
