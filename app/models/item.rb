class Item < ApplicationRecord

	def checkItem(item)
		if item.checked
			item.checked = false
		else 
			item.checked = true
		end 
	end 

end
