class GemItemsController < ApplicationController
  def show
    @gem_item = GemItem.find_by_name(params[:id])
  end

end
