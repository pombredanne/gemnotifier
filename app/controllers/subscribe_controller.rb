class SubscribeController < ApplicationController
  def create
    @gem_item = GemItem.find(params[:gem_id])
    Subscribe.create({:gem_item => @gem_item, :user => current_user})
    render :layout => false
  end

  def destroy
    @gem_item = GemItem.find(params[:gem_id])
    Subscribe.where({:user_id => current_user.id, :gem_item_id => @gem_item.id}).delete_all
    render :layout => false
  end

end
