class InvitationsController < ApplicationController

  before_filter :check_login

  
  def new
    @invitation = Invitation.new
    @users = User.all.map { |u| u.proper_name  }
    @events = Event.all.map { |e| e.title  }
  end

  def index
    @invitation = Invitation.all
    #@attendee = Invitation.find_by_user_id(@invitation.user_id)
  end

  def show
    @invitation = Invitation.find(params[:id])
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    @users = User.all.map { |u| u.proper_name  }
    @events = Event.all.map { |e| e.title  }
    if @invitation.save
      # if saved to database
      flash[:notice] = "Congratulations! You have created an invitation"
      redirect_to 
    else
      # go back to the 'new' form
      render 'new'
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attributes(params[:invitation])
      flash[:notice] = "Successfully updated}."
      redirect_to home_url
    else
      render :action => 'edit'
    end
  end

end
