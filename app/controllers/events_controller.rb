class EventsController < ApplicationController
  
  def new
    @event = Event.new
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def index
    @events = Event.by_date.paginate(:page => params[:page]).per_page(10)
  end
  
  def show
    @event = Event.find(params[:id])
    @attendees = @event.users.paginate(:page => params[:page]).per_page(10) #should be a scope here
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save!
      # if saved to database
      flash[:notice] = "Successfully created #{@event.name}."
      redirect_to @event # go to show Event page
    else
      # go back to the 'new' form
      render :action => 'new'
    end
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated #{@event.name}."
      redirect_to @event
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @invitations = @event.invitations
    for i in @invitations
      i.destroy
    end
    @event.destroy
    flash[:notice] = "Successfully removed #{@event.name} from the Meet with Friends System"
    redirect_to events_url
  end

end