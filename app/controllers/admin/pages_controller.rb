class Admin::PagesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @page = Page.create(page_params)
    if @page.errors.blank?
      redirect_to admin_dashboards_path, flash: { notice: 'Successfully created page.' }
    else
      redirect_to admin_dashboards_path, flash: { error: 'Failed to create page.' }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def page_params
      params.require(:page).permit(
        :title,
        :description,
        :image_url,
        :content
      )
    end
end