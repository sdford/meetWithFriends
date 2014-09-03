class HomeController < ApplicationController

  require 'will_paginate/array'

  def index
  	@user = User.new
    @users = User.alphabetical
    @events = Event.upcoming.by_date

  end

  def new
  end

  def register
  	@user = User.new
  end

end
