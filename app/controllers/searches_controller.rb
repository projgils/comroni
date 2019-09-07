# frozen_string_literal: true

class SearchesController < ApplicationController
  before_action :set_sponsor_pages, only: :index

  def index
    @result_pages = if params[:category_id].blank?
      Page.where("searchable_text ILIKE ?", "%#{params[:search_string]}%").where.not(published_at: nil)
    else
      Page.where(category_id: params[:category_id]).where("searchable_text ILIKE ?", "%#{params[:search_string]}%").where.not(published_at: nil)
    end

    respond_to do |format|
      format.html
    end
  end

  def show; end

  private

    def set_sponsor_pages
      @sponsor_pages = Page.where.not(sponsor: nil).where('sponsor_due > ?', DateTime.now)
    end
end
