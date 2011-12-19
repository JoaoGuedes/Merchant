class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show_friends, :destroy_friends]
  
  def show_friends
      user = User.find(params[:id])
      @friends = user.users_in
      
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @invites }
      end
    end
    
    def destroy_friends
        record = Invite.where("(user_id=? AND user_id_target=?) OR (user_id_target= ? AND user_id = ?)", params[:friend_id], current_user.id, current_user.id, params[:friend_id])
        record.destroy_all
        respond_to do |format|
            format.html { redirect_to :back, notice: 'Friend deleted.' }
          end
      end    
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
