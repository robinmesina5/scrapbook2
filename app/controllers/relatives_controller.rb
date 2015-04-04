class RelativesController < ApplicationController
	# InheritedResources::Base

	def index
		@relatives = current_user.relatives.all
		respond_to do |format|
			format.html
			format.json { render :json => Relative.all }
		end
	end

	def show
		@relative = Relative.find(params[:id])
	end

	def new
		@relative = Relative.new
	end

	def edit
		@relative = Relative.find(params[:id])
	end

	def create
		new_relative = current_user.relatives.create(relative_params)

		redirect_to scrapbook_path(current_user.id)
	end

	def update
		relative = Relative.find(params[:id])
		relative.update(relative_params)

		redirect_to relatives_path
	end

	def destroy
		relative = Relative.find(params[:id])
		relative.destroy

		redirect_to scrapbook_path(current_user.id)
	end

	private

	def relative_params
		params.require(:relative).permit(:first_name, :last_name, :scrapbook_id, :addresss, :age, :birthday, :date_of_death, :father_id, :mother_id, :child_one, :child_two, :child_three, :child_four, :child_five, :child_six, :occupation, :biography, :user_id, :image)
	end

end

