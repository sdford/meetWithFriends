class Event < ActiveRecord::Base
  attr_accessible :description, :end, :location, :location_coord, :start, :active, :title

  has_many :invitations
  has_many :users, :through => :invitations

  validates_time :start, :before => :end
  validates_time :end, :after => :end

  scope :attendees, joins(:invitations).order('user_id')
  scope :alphabetical, order('title')
  scope :by_date, order('start, end')


  def get_coord #Get coord of meeting location
  	
  end

  def check_timeliness(check_in_time) #See if user is on time
    return ((check_in_time - start) * 24 * 60).to_i #convert to minutes
  end

  def within_radius
    if (abs(user.get_coord[0] - location.get_coord[0]) > 0.0005) || (abs(user.get_coord[1] - location.get_coord[1]) > 0.0005)
      return false
    end
    return true
  end

  #check if user is in radius and within certain timeframe
  def eligible_to_check_in(user, check_in_time)
    if check_timeliness(check_in_time) < -60 || !within_radius(user)
      return false
    end
    return true
  end

  def check_in(user)
    check_in_time = DateTime.now
  	if elibible_to_check_in(user, check_in_time)
  	    invitation = user.invitations.select{|i| i.event_id == self.id}.first # first to be safe
  	    invitation.checked_in = true
  	    invitation.save!
  	end
  end

  #give points based on timeliness
  def assign_points
    
  end

end
