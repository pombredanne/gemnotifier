class HomeController < ApplicationController
  def index
    @most_updated_gems = GemItem.most_updated_gems
    @most_subscribed_gems = GemItem.most_subscribed_gems
  end

  def search
    params[:order] ||= 'name'
    @gem_items = GemItem.where(["name like :name", {:name => "%#{params[:query]}%"}]).order(params[:order]).page params[:page]
  end
  
  def browse
    params[:order] ||= 'name'
    @gem_items = GemItem.order("#{params[:order]} desc").page params[:page]
  end
  
end
