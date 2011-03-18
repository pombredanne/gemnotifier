class HomeController < ApplicationController
  def index
    @most_updated_gems = GemItem.most_updated_gems
    @most_subscribed_gems = GemItem.most_subscribed_gems
  end

  def search
    @gem_items = GemItem.where("name like '%#{params[:query]}%'").page params[:page]
  end
  
  def browse
    @gem_items = GemItem.order(:name).page params[:page]
  end
  
end
