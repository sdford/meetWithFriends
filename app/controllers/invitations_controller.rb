class InvitationsController < ApplicationController

  before_filter :check_login

  
  def new
    @invitation = Invitation.new
    @users = User.all.map { |u| u.proper_name  }
    @events = Event.all.map { |e| e.title  }
  end

  def index
    @invitation = Invitation.find(params[:id])
    @attendee = Invitation.find_by_user_id(@invitation.user_id)
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      # if saved to database
      flash[:notice] = "Congratulations! You have created an invitation"
      redirect_to @invitation
    else
      # go back to the 'new' form
      render 'new'
    end
  end

end
