class NotificationMailer < ActionMailer::Base
  default_url_options[:host] = "rubyusergroup.be"
  default :from => "noreply@rubyusergroup.be"

  helper :application

  def new_question_email(question, user)
    @question = question
    mail(:to => user.email,
         :subject => question.email_subject)
  end

  def new_answer_email(answer, user)
    @answer = answer
    @question = answer.question
    mail(:to => user.email,
         :subject => "Re: #{@question.email_subject}")
  end

  def new_feedback_email(feedback)
    @feedback = feedback
    mail(:to => ENV['GMAIL_LOGIN'],
         :subject => "Feedback von #{feedback.author}")
  end

  def new_newsletter_email(newsletter)
    mail(:to => newsletter.email,
         :subject => 'Ruby User Group Bern Newsletter')
  end

end
