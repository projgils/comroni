class Admin::PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_main_page, only: [:new, :create]

  def new; end

  def create
    @page = Page.create(page_params)
    if @page.errors.blank?
      flash[:notice] = 'Successfully created page.'
      redirect_to admin_dashboards_path
    else
      flash[:error] = @page.errors.full_messages.to_sentence
      redirect_to admin_dashboards_path
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_params)
    if @page.errors.blank?
      flash[:notice] = 'Page updated successfully.'
    else
      flash[:notice] = @page.errors.full_messages.to_sentence
    end
    redirect_to edit_admin_page_path(@page)
  end

  def destroy
    page = Page.find(params[:id])
    if page.published_at.blank?
      page.destroy
      flash[:notice] = 'Page removed.'
    else
      flash[:notice] = 'Unpublish the page first, before removing.'
    end
    redirect_to admin_dashboards_path
  end

  private

    def page_params
      params.require(:page).permit(
        :title,
        :description,
        :image_url,
        :content,
        :published_at,
        :main_page_id,
        :address_details,
        :category_id
      )
    end

    def set_main_page
      @main_page = nil
      @main_page = Page.find(params[:main_page_id]) if params[:main_page_id]
    end
end