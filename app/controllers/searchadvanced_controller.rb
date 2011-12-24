class SearchadvancedController < ApplicationController

  def index
    @search = Collection.search(params[:search])
    @collections = @search.all
    # @collections = Collection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collections }
    end
  end

end
