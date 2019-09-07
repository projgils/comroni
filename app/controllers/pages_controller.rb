class PagesController < ApplicationController
	def index
    @pages = Page.where(main_page_id: nil).where.not(published_at: nil)
	end
  
	def show
		@page = Page.friendly.find(params[:id])
	end
end
