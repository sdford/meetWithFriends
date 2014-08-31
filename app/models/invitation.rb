class Invitation < ActiveRecord::Base
  attr_accessible :date, :event_id, :user_id, :checked_in

  belongs_to :event
  belongs_to :user

  validates_date :date

  scope :by_date, order('date')
  
  #checkin
end
