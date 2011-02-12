require 'spec_helper'

describe Question do

  it_should_behave_like 'factory creatable'

  describe "associations: " do
    it { should belong_to(:author) }
    it { should have_many(:answers) }
  end

  describe "validations: " do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:author) }
  end

  describe "defaults: " do
    subject { Question.new }

    it "should not be solved by default" do
      subject.solved.should be_false
    end
  end

  describe "formatting: " do
    subject do
      question = Question.new
      question.stub!(:author => 'Heinrich Henne',
                     :title => 'Titel?',
                     :content => 'Inhalt')
      question
    end

    describe "#jabber_text" do
      it "should build a jabber friendly message" do
        subject.jabber_text.should == "Frage von Heinrich Henne:\n\nTitel?\nInhalt"
      end
    end

    describe "#to_s" do
      it "should use the title" do
        subject.to_s.should == "Titel?"
      end
    end
  end

  describe "finders: " do

    describe "#participants" do
      let(:author) { Factory(:user) }
      subject { Factory(:question, :author => author) }
      before do
        subject.answers << @answer1 = Factory(:answer)
        Factory(:answer)
        subject.answers << Factory(:answer, :author => author)
        subject.answers << @answer2 = Factory(:answer)
        Factory(:user)
      end

      it "should return the question author and the answer authors" do
        subject.participants.map(&:id).should =~ [author.id,
                                                  @answer1.author.id,
                                                  @answer2.author.id]
      end
    end

    describe "#solved, #unsolved" do
      before(:each) do
        @solved1 = Factory(:question, :solved => true)
        @unsolved1 = Factory(:question, :solved => false)
        @solved2 = Factory(:question, :solved => true)
        @unsolved2 = Factory(:question, :solved => false)
      end

      it "should return solved questions only" do
        Question.solved.map(&:id).should == [@solved2.id, @solved1.id]
      end

      it "should return unsolved questions only" do
        Question.unsolved.map(&:id).should == [@unsolved2.id, @unsolved1.id]
      end

    end
  end

end
