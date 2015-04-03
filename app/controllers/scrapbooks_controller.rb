class ScrapbooksController < ApplicationController
	before_action :set_scrapbook, only: [:show, :edit, :update, :destroy]

def index
	@scrapbooks = Scrapbook.all
		respond_to do |format|
			format.html { render :index }
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
		scrapbook.update(scrapbook_params)

		redirect_to scrapbook_path(current_user.id)
	end

	def edit
		@scrapbook = Scrapbook.find_by_user_id(current_user.id)
	end

	def destroy
		scrapbook.destroy

		redirect_to root_path	
	end

  private

    def scrapbook_params
      params.require(:scrapbook).permit(:name, :user_id, :relative_id)
    end

    def set_scrapbook
			@scrapbook = Scrapbook.find(params[:id])
    end
end

