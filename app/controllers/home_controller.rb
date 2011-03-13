class HomeController < ApplicationController
  def index
    @gem_items = GemItem.order(:name).page params[:page]
  end

end
