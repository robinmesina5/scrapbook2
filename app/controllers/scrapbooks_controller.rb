class ScrapbooksController < ApplicationController

def index
	@scrapbooks = Scrapbook.all
		respond_to do |format|
			format.html
			format.json {
				scrapbooks = Scrapbook.all
				render :json => scrapbooks
			}
		end
	end

	def new
		@scrapbook = Scrapbook.new
	end

	def create
		scrapbook = Scrapbook.create(scrapbook_params)
		# render :json => scrapbook
		redirect_to scrapbook_path(current_user.id)
	end

	def show
		@relatives = Relative.all
	end

	def update
		scrapbook = Scrapbook.find(params[:id])
		scrapbook.update(scrapbook_params)

		redirect_to scrapbook_path(current_user.id)
	end

	def destroy
		scrapbook = Scrapbook.find(params[:id])
		scrapbook.destroy

		redirect_to root_path	
	end

  private

    def scrapbook_params
      params.require(:scrapbook).permit(:name, :user_id, :relative_id)
    end
end

