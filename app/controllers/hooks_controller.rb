class HooksController < ApplicationController
  
  def gems
    puts params
    render :nothing => true
  end

end
