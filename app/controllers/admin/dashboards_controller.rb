class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def index
  end
end