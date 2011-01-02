require 'spec_helper'

describe Topic do

  it_should_behave_like 'factory creatable'

  describe "associations: " do
    it { should belong_to(:submitter) }
    it { should have_many(:votes) }
  end

  describe "validations: " do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:submitter) }
  end

  describe "formatting: " do
    subject { Factory.build(:topic, :title => 'Cukeing it right') }
    it "should use the title as string representation" do
      subject.to_s.should == 'Cukeing it right'
    end
  end

  describe "scopes: " do
    describe "#top_5" do
      before(:each) do
        @one = Factory(:topic)
        @two = Factory(:topic)
        @three = Factory(:topic)
        @four = Factory(:topic)
        @five = Factory(:topic)
        @six = Factory(:topic)
      end

      it "should return the latest five topics" do
        Topic.top_5.map(&:id).should == [@six.id, @five.id, @four.id, @three.id, @two.id]
      end
    end
  end

  describe "#voted_by?" do
    subject { Factory(:topic) }
    let(:current_user) { Factory(:user) }
    context "with votes from user" do
      before(:each) { Factory(:vote, :voter => current_user, :topic => subject) }
      it { subject.voted_by?(current_user).should be_true }
    end

    context "with votes from other users" do
      before(:each) { Factory(:vote, :topic => subject) }

      it { subject.voted_by?(current_user).should be_false }
    end

    context "without votes" do
      it { subject.voted_by?(current_user).should be_false }
    end
  end

end
