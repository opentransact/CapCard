class Card < ActiveRecord::Base
  validates_presence_of :name#,:email
  
  attr_accessible :email,:name
  
  before_create :create_codes
  
  protected
  
  def create_codes
    self.key=ActiveSupport::SecureRandom.hex
    self.number="%08d" % ActiveSupport::SecureRandom.random_number(99999999)
    self.pin="%04d" % ActiveSupport::SecureRandom.random_number(9999)
    self.expiry=1.year.from_now
  end
end
