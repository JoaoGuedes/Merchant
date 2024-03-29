class CollectionsController < ApplicationController
  # GET /collections
  # GET /collections.json
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  
  def index
    @search = Collection.search(params[:search])
    @collections = @search.all
    # @collections = Collection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collections }
    end
  end

  # GET /collections/byCategory/Records
  # GET /collections/byCategory/Records.json
  def showbyname
    category = Category.where("name=?", params[:name]).first
    @collections = Collection.where("category_id=?", category.id)
    @title = params[:name]
    respond_to do |format|
      format.html # showbyname.html.erb
      format.json { 
        render :json => @collections.to_json(
          :include => {
              :user => { 
                :only => :name 
              },
              :items => {
                :only => :title,
                :methods => [:url_thumb]
              }
          },
          
          :only => [:title, :description, :created_at, :visibility, :id]
          
          )
      }
    end
  end
  
  def showbyuser
    #name = User.where("user_id=?", params[:id]).name
    @collections = Collection.where("user_id=?", params[:id])
    @id = params[:id]
    @title = params[:name]
    respond_to do |format|
      format.html # showbyuser.html.erb
      format.json {
        render :json => @collections.to_json(
          :include => {
              :user => {
                :only => :name
              },
              :items => {
                :only => :title,
                :methods => [:url_thumb]
              }
          },

          :only => [:title, :description, :created_at, :visibility, :id]

          )
      }
    end
  end

  def showbymail
    user = User.where("email=?" , params[:email]).first
    @collections = Collection.where("user_id=?", user.id)
    @title = params[:name]
    respond_to do |format|
      format.html # showbymail.html.erb
      format.json {
        render :json => @collections.to_json(
          :include => {
              :user => {
                :only => :name
              },
              :items => {
                :only => :title,
                :methods => [:url_thumb]
              }
          },

          :only => [:title, :description, :created_at, :visibility, :id]

          )
      }
    end
  end

  def show
    @collection = Collection.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collection }
    end
  end
  # GET /collections/new
  # GET /collections/new.json
  def new
    @collection = Collection.new
    
    @collection.items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
  end

  # POST /collections
  # POST /collections.json
  def create
    
    @collection = Collection.new(params[:collection])

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render json: @collection, status: :created, location: @collection }
      else
        format.html { render action: "new" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.json
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to :controller=>"collections", :action=>"showbyuser", :id => @collection.user }
      format.json { head :ok }
    end
  end
end
