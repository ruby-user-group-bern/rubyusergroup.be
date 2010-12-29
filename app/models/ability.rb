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

    can :create, Vote
    can :create, Topic
    can :create, Answer
    can :create, Question

    can :read, :all
  end
end
