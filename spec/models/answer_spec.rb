require 'spec_helper'

describe Answer do

  it_should_behave_like 'factory creatable'

  describe "associations: " do
    it { should belong_to(:question) }
    it { should belong_to(:author) }
  end

  describe "validations: " do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:content) }
  end

  describe "formatting: " do
    describe "#jabber_text" do
      subject do
        answer = Answer.new
        answer.stub! :author => 'Meister Eder', :content => 'Wo bist du?'
        answer.stub_chain :question, :title => 'Um was geht es hier?'
        answer
      end

      it "should build a jabber friendly representation" do
        subject.jabber_text.should == "Antwort auf die Frage 'Um was geht es hier?':\n\nMeister Eder sagt:\nWo bist du?"
      end
    end
  end

  describe "after creating: " do
    describe "#send_mail" do
      before(:each) do
        @user     = Factory(:user, :receive_email_notifications => true)
        @question = Factory.create(:question, :author => @user)
        Delayed::Worker.new.work_off
      end

      subject { Answer.new(:content => 'I know it!', :question => @question, :author => Factory(:user)) }

      it "delayed job should work off one job" do
        subject.save
        success, failure = Delayed::Worker.new.work_off
        failure.should == 0
        success.should == 1
      end

      it "one mail should be sended" do
        subject.save
        ActionMailer::Base.deliveries = []
        Delayed::Worker.new.work_off
        ActionMailer::Base.deliveries.size.should == 1
      end
    end
  end

end
