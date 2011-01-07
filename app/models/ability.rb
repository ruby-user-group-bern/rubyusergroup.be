class Ability
  include CanCan::Ability

  def initialize(user)
    can :vote, Topic do |topic|
      can?(:create, Vote) && !topic.voted_by?(user) && topic.submitter != user
    end

    can :manage, Question do |question|
      question.author == user
    end

    can :manage, Answer do |answer|
      answer.author == user
    end

    can :destroy, Topic do |topic|
      topic.submitter == user
    end

    can :create, Vote
    can :create, Topic
    can :create, Answer
    can :create, Question
    can :create, Feedback

    can :read, :all
    cannot :read, Feedback
  end
end
