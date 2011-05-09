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

  def with_gemfile
  end
  
  def select_gems
    parser = GemfileParser.parse(params)
    parser.parse
    if parser.errors.size > 0
      flash[:error] = parser.errors.join(',')
      redirect_to '/with_gemfile'
      return
    else
      @gems_to_subscribe = parser.gems_to_subscribe
    end
  end
  
  def subscribe_gems
    if params[:gems].blank?
      flash[:notice] = "No gems is selected."
    else
      current_user.subscribe_gems(params[:gems])
      flash[:notice] = "Successfully subscribed all gems in Gemfile!"
    end
    redirect_to '/'
  end
  
end
