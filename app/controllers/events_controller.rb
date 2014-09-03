class EventsController < ApplicationController
  
  before_filter :check_login
  authorize_resource
  
  def new
    @event = Event.new
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def check_in
    @event = Event.find(params[:id])
    @user = current_user
    @event.check_in(@user)
  end
  
  def index
    @events = Event.by_date.paginate(:page => params[:page]).per_page(5)
  end
  
  def show
    @event = Event.find(params[:id])
    @attendees = @event.users.paginate(:page => params[:page]).per_page(10) #should be a scope here
  end
  
  def create
    @event = Event.new(params[:event])
    client = GooglePlaces::Client.new("AIzaSyC5TfII21fg8SeJtbkxc9Whh3kDO-IKCx4")
    client.spots_by_query(@event.location).first
#     puts "blah"
#     puts current_user.latitude
#     puts current_user.longitude
#     puts "blah"
    location = client.spots(current_user.latitude, current_user.longitude, :radius => 10000, :name => @event.location).first
    @event.latitude = location.lat
    @event.longitude = location.lng
    if @event.save!
      # if saved to database
      flash[:notice] = "Successfully created #{@event.title}."
      redirect_to home_url # go to show Event page
    else
      # go back to the 'new' form
      render :action => 'new'
    end
  end
  
  def update
    @event = Event.find(params[:id])
    client = GooglePlaces::Client.new("AIzaSyC5TfII21fg8SeJtbkxc9Whh3kDO-IKCx4")
    client.spots_by_query(@event.location).first
#     puts "blah"
#     puts current_user.latitude
#     puts current_user.longitude
#     puts "blah"
    location = client.spots(current_user.latitude, current_user.longitude, :radius => 10000, :name => @event.location).first
#     puts "blah"
#     puts location
#     puts "blah"
    @event.latitude = location.lat
    @event.longitude = location.lng
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated #{@event.title}."
      redirect_to home_url
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
    flash[:notice] = "Successfully removed #{@event.title} from the Meet with Friends System"
    redirect_to home_url
  end

end