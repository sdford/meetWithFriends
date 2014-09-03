class InvitationsController < ApplicationController

  before_filter :check_login
  authorize_resource
  
  def new
    @invitation = Invitation.new
  end

  def index
    @invitation = Invitation.find(params[:id])
    @attendee = Invitation.find_by_user_id(@invitation.user_id)
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.date = Date.today
    if @invitation.save!
      # if saved to database
      flash[:notice] = "Congratulations! You have successfully registered for Project C.H.U.C.K"
      redirect_to @invitation
    else
      # go back to the 'new' form
      render 'new'
    end
  end

end
