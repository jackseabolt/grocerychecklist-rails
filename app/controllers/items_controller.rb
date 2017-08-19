	class ItemsController < ApplicationController
	  def index
	  	@items = Item.all.reverse
	  	@newitem = Item.new 
	  	@counter = handleCounter()
	  end

	  def create 
	  	@newitem = Item.new(item_params)
	  	if @newitem.save 
	  		redirect_to root_path
	  	else 
	  		render 'index'
	  		flash.now[:danger] = "There was a problem"
	  	end 
	  end

	  def destroy 
	  	@item = Item.find(params[:id])
	  	@item.destroy
	  	if @item.destroy 
	  		redirect_to root_path
	  	else 
	  		render 'index'
	  		flash.new[:danger] = "There was a problem"
	  	end 
	  end 

	  def checked 
	  	@item = Item.find(params[:id])
	  	if !@item.checked
	  		@item.update(checked: true) 
	  	else
	  		@item.update(checked: false)
	  	end 
	  	redirect_to root_path
	  end 

	  def getTotalChecked(items)
	  	result = []
	  	items.each do |i|
	  		if i.checked
	  			result << i
	  		end 
	  	end 
	  	return result.length
	  end 

	  def handleCounter 
	  	items = Item.all
	  	total = items.length
	  	totalChecked = getTotalChecked(items)
	  	string = totalChecked.to_s + " of " + total.to_s + " COLLECTED"
	  	return string
	  end 

	  private 

	 	def item_params
	 		params.require(:item).permit(:name, :checked)
	 	end  
	end
