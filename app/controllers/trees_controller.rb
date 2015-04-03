class TreesController < ApplicationController

	def index
	end

	def data
		respond_to do |format|
			format.html { render :index }
			format.json { render :json => Relative.all }
		end
	end
end



