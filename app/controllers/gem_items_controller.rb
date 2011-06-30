class GemItemsController < ApplicationController
  
  def show
    @gem_item = GemItem.where(:name => params[:id]).first
    if @gem_item.nil?
      render :file => "#{Rails.root}/public/404.html", :status => :not_found 
    end
  end

end
