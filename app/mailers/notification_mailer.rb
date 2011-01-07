class NotificationMailer < ActionMailer::Base
  default_url_options[:host] = "rubyusergroup.be"
  default :from => "noreply@rubyusergroup.be"

  helper :application

  def new_question_email(question, user)
    @question = question
    mail(:to => user.email,
         :subject => "#{question.author} fragt: #{question}")
  end

  def new_answer_email(answer, user)
    @answer = answer
    @question = answer.question
    mail(:to => user.email,
         :subject => "#{answer.author} antwortet auf: #{answer.question}")
  end

  def new_feedback_email(feedback)
    @feedback = feedback
    mail(:to => 'feedback@rubyusergroup.be',
         :subject => "Feedback von #{feedback.author}")
  end

end
