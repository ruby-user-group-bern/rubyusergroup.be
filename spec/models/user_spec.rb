require 'spec_helper'

describe User do

  it_should_behave_like 'factory creatable'

  describe "associations: " do
    it { should have_many(:questions) }
    it { should have_many(:topics) }
    it { should have_many(:answers) }
  end

  describe "formatting: " do
    subject { Factory(:user, :email => 'hans.test@test.me') }

    describe "#to_s" do
      it "should remove the domain from the email" do
        subject.to_s.should == 'hans.test'
      end
    end
  end

end
