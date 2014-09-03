class UsersController < ApplicationController

  def new
    @user = User.new
    authorize! :new, current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def index
    if check_login
      @users = User.alphabetical.paginate(:page => params[:page]).per_page(5)
    else
      redirect_to home_path
    end
  end
  
  def show
    if check_login
      @user = User.find(params[:id])
      @events = @user.events
      @users = User.alphabetical
    else
      redirect_to home_path
    end
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
    authorize! :create, current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated #{@user.proper_name}."
      redirect_to @user
    else
      render :action => 'edit'
    end
    authorize! :update, current_user
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destory
    flash[:notice] = "Successfully removed #{@user.proper_name} from the Meet with Friends System"
    redirect_to home_path
  end
  
end