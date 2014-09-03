class UsersController < ApplicationController
  
  before_filter :check_login
  authorize_resource
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.alphabetical.paginate(:page => params[:page]).per_page(5)
  end
  
  def show
    @user = User.find(params[:id])
    @events = @user.events
    @users = User.alphabetical
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      # if saved to database
      flash[:notice] = "Successfully created #{@user.proper_name}."
      redirect_to @user # go to show user page
    else
      # go back to the 'new' form
      render :action => 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated #{@user.proper_name}."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destory
    flash[:notice] = "Successfully removed #{@user.proper_name} from the Meet with Friends System"
    redirect_to @user
  end
  
end