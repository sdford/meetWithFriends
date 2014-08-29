class Event < ActiveRecord::Base
  attr_accessible :description, :end, :location, :location_coord, :start
end
