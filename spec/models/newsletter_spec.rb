require 'spec_helper'

describe Newsletter do

  describe "validations: " do
    before(:each) { Factory(:newsletter) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).
                with_message(/wurde bei der Abonnierung des Newsletters schon verwendet/) }
  end

end
