class Ability
  include CanCan::Ability

  def initialize(user)
    can :vote, Topic do |topic|
      !topic.voted_by?(user) && topic.submitter != user
    end

    can :manage, Question do |question|
      question.author == user
    end

    can :create, Question

    can :read, :all
  end
end
