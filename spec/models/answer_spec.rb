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

end
