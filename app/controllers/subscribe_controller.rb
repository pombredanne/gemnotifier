class SubscribeController < ApplicationController
  
  before_filter :logged_in?
  
  def index
    @gem_items = current_user.subscribed_gems
  end
  
  def create
    @gem_item = GemItem.find(params[:gem_id])
    Subscribe.create({:gem_item => @gem_item, :user => current_user})
    render :layout => false
  end

  def destroy
    @gem_item = GemItem.find(params[:gem_id])
    Subscribe.where({:user_id => current_user.id, :gem_item_id => @gem_item.id}).destroy_all
    render :layout => false
  end

end
