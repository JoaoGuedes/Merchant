class InviteController < ApplicationController
  def create
    @invite = Invite.new(:user_id => current_user, :user_id_target => params[:dest_id])

    respond_to do |format|
      if @invite.save
        format.html { redirect_to :back, notice: 'Invite was sent.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def show
    invites = User.find(params[:id]).invites_in
    @invites = invites.find(:all).select{|i|i.user_id_target = current_user}.select{|i|i.is_accepted!=true}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invites }
    end
  end
  
  def accept
    invite = Invite.find(params[:invite])
    invite.is_accepted = true;

    respond_to do |format|
      if invite.save
        format.html { redirect_to :back, notice: 'Invite accepted.' }
      else
         format.html { redirect_to :back, notice: 'Invite could not be accepted.' }
      end
    end
  end
   
  def deny
    invite = Invite.find(params[:invite])

    respond_to do |format|
      if invite.delete
        format.html { redirect_to :back, notice: 'Invite denied.' }
      else
         format.html { redirect_to :back, notice: 'Invite could not be denied.' }
      end
    end
  end   
end
