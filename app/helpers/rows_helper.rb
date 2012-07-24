module RowsHelper

	def is_right_size(index, num_of_columns)
		if (index + 1) % 2 == 0 
			return 	"style='clear:both;'"
		end
	end

	def is_first_header_column(index)
		if (index == 0)
			return raw "<th>"
		end
	end	

	def is_last_header_column(index, num_of_columns)
		if (index + 1) % num_of_columns == 0
			return raw "</th>"
		end
	end			

	def is_first_column(index)
		if (index == 0)
			return raw "<tr>"
		end
	end	

	def is_last_column(index, num_of_columns)
		if (index + 1) % num_of_columns == 0
			return raw "</tr>"
		end
	end		
end
