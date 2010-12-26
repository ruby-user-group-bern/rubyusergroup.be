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
