require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Card do
  before(:each) do
    @card=Card.make
  end
  
  it "should have number" do
    @card.number.should_not be_nil
    @card.number.length.should==8
  end
  
  it "should have a key" do
    @card.key.should_not be_nil
    @card.key.length.should==32
  end
  
  it "should have a pin" do
    @card.pin.should_not be_nil
    @card.pin.length.should==4
  end
  
  it "should have an expiry date" do
    @card.expiry.should==1.year.from_now.to_date
  end
end
