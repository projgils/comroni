# frozen_string_literal: true

class Admin::PublishPagesController < ApplicationController
  before_action :authenticate_user!

  def update
    page = Page.find(params[:id])
    new_published_at_value = page.published? ? nil : DateTime.now
    page.update(published_at: new_published_at_value)
    flash[:notice] = 'Page updated successfully.'
    redirect_back fallback_location: root_path
  end
end
