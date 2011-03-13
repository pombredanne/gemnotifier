class HomeController < ApplicationController
  def index
    @gem_items = GemItem.order(:name).page params[:page]
  end

  def search
    @gem_items = GemItem.where("name like '%#{params[:query]}%'").page params[:page]
  end
  
end
