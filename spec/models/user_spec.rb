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
      context "with github_username" do
        before(:each) { subject.github_username = 'hacker' }

        it "should return the github_username" do
        subject.to_s.should == 'hacker'
        end
      end

      context "without github account" do
        it "should remove the domain from the email" do
          subject.to_s.should == 'hans.test'
        end
      end
    end
  end

  describe "scopes: ", :slow => true do
    describe "notified_by_jabber" do
      before(:each) do
        @notified = Factory(:user, :receive_jabber_notifications => true)
        @not_notified = Factory(:user, :receive_jabber_notifications => false)
      end

      it "should only return flagged users" do
        User.notified_by_jabber.should == [@notified]
      end
    end

    describe "notified_by_email" do
      before(:each) do
        @notified = Factory(:user, :receive_email_notifications => true)
        @not_notified = Factory(:user, :receive_email_notifications => false)
      end

      it "should only return flagged users" do
        User.notified_by_email.should == [@notified]
      end
    end
  end

end
