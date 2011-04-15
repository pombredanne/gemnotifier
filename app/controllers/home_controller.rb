class HomeController < ApplicationController
  def index
    @most_updated_gems = GemItem.most_updated_gems
    @most_subscribed_gems = GemItem.most_subscribed_gems
  end

  def search
    params[:order] ||= 'downloads desc'
    @gem_items = GemItem.search(params[:query]).order(params[:order]).page params[:page]
  end
  
  def browse
    params[:order] ||= 'name'
    @gem_items = GemItem.order("#{params[:order]} #{params[:order] == 'name' ? 'asc' : 'desc' }").page params[:page]
  end
  
end
