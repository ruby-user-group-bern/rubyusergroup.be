require 'spec_helper'

describe Ability do
  let(:current_user) { Factory(:user) }
  subject { Ability.new(current_user) }

  describe "questions" do
    let(:question) { Factory(:question) }

    it { should be_able_to(:create, Question) }
    it { should be_able_to(:read, Question) }
    it { should_not be_able_to(:manage, question) }

    context "author" do
      let(:question) { Factory(:question, :author => current_user) }
      it { should be_able_to(:manage, question) }
    end
  end

  describe "answers" do
    let(:answer) { Factory.build(:question) }
    it { should be_able_to(:create, Answer) }
    it { should be_able_to(:read, Answer) }
    it { should_not be_able_to(:manage, answer) }

    context "author" do
      let(:answer) { Factory.build(:answer, :author => current_user) }
      it { should be_able_to(:manage, answer) }
    end
  end

  describe "topics" do
    let(:topic) { Factory.build(:topic) }
    it { should be_able_to(:create, Topic) }
    it { should be_able_to(:read, Topic) }
    it { should_not be_able_to(:destroy, topic) }

    context "submitter" do
      let(:topic) { Factory.build(:topic, :submitter => current_user) }

      it { should be_able_to(:destroy, topic) }
    end
  end

  describe "votes" do
    let(:submitter) { Factory(:user) }
    let(:topic) { Factory(:topic, :submitter => submitter) }

    before(:each) do
      topic.stub!(:voted_by?) {false}
    end

    it { should be_able_to(:create, Vote) }

    context "the owner" do
      let(:submitter) { current_user }

      it { should_not be_able_to(:vote, topic) }
    end

    context "user, which has already voted" do
      before(:each) do
        topic.stub!(:voted_by?) {true}
      end

      it { should_not be_able_to(:vote, topic) }
    end

    it { should be_able_to(:vote, topic) }

  end

end
