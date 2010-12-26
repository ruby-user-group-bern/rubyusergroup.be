require 'spec_helper'

describe Ability do
  let(:current_user) { Factory(:user) }
  subject { Ability.new(current_user) }

  describe "vote for topics" do
    let(:submitter) { Factory(:user) }
    let(:topic) { Factory(:topic, :submitter => submitter) }

    before(:each) do
      topic.stub!(:voted_by?) {false}
    end


    context "the owner" do
      let(:submitter) { current_user }

      it "can not vote" do
        subject.should_not be_able_to(:vote, topic)
      end
    end

    context "user, which has already voted" do
      before(:each) do
        topic.stub!(:voted_by?) {true}
      end

      it "can not vote" do
        subject.should_not be_able_to(:vote, topic)
      end

    end

    it "can vote" do
      subject.should be_able_to(:vote, topic)
    end

  end

end
