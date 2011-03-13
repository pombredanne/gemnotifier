class HooksController < ApplicationController
  
  def gems
    gem_item = GemItem.where(:name => params[:name]).first
    
    attrs = params.except(:controller, :action, :format)
    if gem_item.nil?
      gem_item = GemItem.create(attrs)
    else
      gem_item.update_attributes(attrs)
    end
    render :nothing => true
  end

end
