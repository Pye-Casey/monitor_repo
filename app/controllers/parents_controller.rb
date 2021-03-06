class ParentsController < ApplicationController
	
	def index
		@parents = Parent.all
	end
  
	def show
		@parent = Parent.find(params[:id])
	end
	
	def new
		@parent = Parent.new
	end
	
	def edit
		@parent = Parent.find(params[:id])
	end
	
	def create
		@parent = Parent.new(parent_params)
		
		if @parent.save
			redirect_to @parent
		else
			render 'new'
		end
		
		/@parent.save

		redirect_to @parent/
	end
	
	def update
		@parent = Parent.find(params[:id])
		if @parent.update(parent_params)
			redirect_to @parent
		else
			render 'edit'
		end
	end
	
	def destroy
	  @parent = Parent.find(params[:id])
	  @parent.destroy
	  redirect_to parents_path
	end
	
	private
	def parent_params 
		params.require(:parent).permit(:fName, :lName)
	end
end
