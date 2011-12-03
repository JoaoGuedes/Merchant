class MessengersController < ApplicationController
  # GET /messengers
  # GET /messengers.json
  def index
    @messengers = Messenger.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messengers }
    end
  end

  # GET /messengers/1
  # GET /messengers/1.json
  def show
    @messenger = Messenger.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @messenger }
    end
  end

  # GET /messengers/new
  # GET /messengers/new.json
  def new
    @messenger = Messenger.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @messenger }
    end
  end

  # GET /messengers/1/edit
  def edit
    @messenger = Messenger.find(params[:id])
  end

  # POST /messengers
  # POST /messengers.json
  def create
    @messenger = Messenger.new(params[:messenger])

    respond_to do |format|
      if @messenger.save
        format.html { redirect_to @messenger, notice: 'Messenger was successfully created.' }
        format.json { render json: @messenger, status: :created, location: @messenger }
      else
        format.html { render action: "new" }
        format.json { render json: @messenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messengers/1
  # PUT /messengers/1.json
  def update
    @messenger = Messenger.find(params[:id])

    respond_to do |format|
      if @messenger.update_attributes(params[:messenger])
        format.html { redirect_to @messenger, notice: 'Messenger was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @messenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messengers/1
  # DELETE /messengers/1.json
  def destroy
    @messenger = Messenger.find(params[:id])
    @messenger.destroy

    respond_to do |format|
      format.html { redirect_to messengers_url }
      format.json { head :ok }
    end
  end
end
