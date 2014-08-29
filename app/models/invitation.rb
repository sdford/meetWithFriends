class Invitation < ActiveRecord::Base
  attr_accessible :date, :event_id, :user_id
end
