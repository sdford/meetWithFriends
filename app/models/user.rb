class User < ActiveRecord::Base
  # Use built-in rails support for password protection
  has_secure_password
  
  has_many :invitations
  has_many :events, :through => :invitations
  
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :photo, :points, :username

  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "Email is not in a valid format"
  validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => false
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username

  scope :alphabetical, order('last_name, first_name')
  scope :by_points, order('points')

  def get_coord
    
  end

  def proper_name
    "#{first_name} #{last_name}"
  end


end
