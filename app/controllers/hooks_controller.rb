class HooksController < ApplicationController
  
  def gems
    gem_item = GemItem.find(params[:name])
    if gem_item.nil?
      gem_item = GemItem.create(params)
    else
      gem_item.update_attributes(params)
    end
    render :nothing => true
  end

end
