class Card < ActiveRecord::Base
  validates_presence_of :name,:email
  
  attr_accessible :name,:email
  
  before_create :create_codes
  
  after_create :send_credentials
  
  include OpenTransact
  
  
  protected
  
  def create_codes
    self.key=ActiveSupport::SecureRandom.hex
    self.number="%08d" % ActiveSupport::SecureRandom.random_number(99999999)
    self.pin="%04d" % ActiveSupport::SecureRandom.random_number(9999)
    self.expiry=1.year.from_now
  end
  
  def send_credentials
    RegistrationNotifier.deliver_credentials(self)
  end
end
