class Admin::DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pages = Page.where(main_page_id: nil).order(updated_at: :desc)
    @sub_pages = Page.where.not(main_page_id: nil)
    @all_pages = Page.all
  end
end