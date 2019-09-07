class HomepageController < ApplicationController
  def index
  	@featured_pages = Page.where(main_page_id: nil).where.not(published_at: nil).order(published_at: :desc)
  end
end