# -*- coding: utf-8 -*-
require "spec_helper"

describe NotificationMailer do
  let(:receiver) { Factory(:user, :email => 'send.mails@me.com') }

  describe "#new_question_email" do
    let(:author) do
      user = Factory(:user)
      user.stub!(:to_s => 'Hansli')
      user
    end
    let(:question) { Factory(:question,
                             :title => 'What is your favorite color?',
                             :content => 'please tell me what color you like...',
                             :author => author) }
    subject { NotificationMailer.new_question_email(question, receiver).deliver }

    its(:to) { should == ['send.mails@me.com'] }
    its(:subject) { should == 'Hansli fragt: What is your favorite color?' }
    its(:encoded) { should =~ /What is your favorite color?/ }
    its(:encoded) { should include('<h1><a href="http://rubyusergroup.be/questions/1">What is your favorite color?</a></h1>') }
    its(:encoded) { should =~ /please tell me what color you like.../ }
  end

  describe "#new_answer_email" do
    let(:author) do
      user = Factory(:user)
      user.stub!(:to_s => 'Ueli')
      user
    end
    let(:question) { Factory(:question, :title => 'What is your favorite color?') }
    let(:answer) { Factory(:answer,
                           :question => question,
                           :content => 'I love red',
                           :author => author) }
    subject { NotificationMailer.new_answer_email(answer, receiver).deliver }

    its(:to) { should == ['send.mails@me.com'] }
    its(:subject) { should == 'Ueli antwortet auf: What is your favorite color?' }
    its(:encoded) { should =~ /What is your favorite color?/ }
    its(:encoded) { should =~ /I love red/ }
    its(:encoded) { should include('<h1><a href="http://rubyusergroup.be/questions/1">What is your favorite color?</a></h1>') }
    its(:encoded) { should =~ /I love red/ }
  end

  describe "#new_feedback_mail" do
    let(:author) do
      user = Factory(:user)
      user.stub!(:to_s => 'Jakobli')
      user
    end
    let(:feedback) do
      Factory(:feedback, :title => 'You doing it great!',
              :content => 'We should organize a bbq...',
              :author => author)
    end

    before do
      ENV.should_receive(:[]).with('GMAIL_LOGIN').any_number_of_times.and_return('feedback@rubyusergroup.be')
    end

    subject { NotificationMailer.new_feedback_email(feedback).deliver }

    its(:to) { should == ['feedback@rubyusergroup.be'] }
    its(:subject) { should == 'Feedback von Jakobli' }
    its(:encoded) { should =~ /You doing it great!/ }
    its(:encoded) { should =~ /We should organize a bbq.../ }
  end

  describe "#new_newsletter_email" do
    let(:newsletter) do
      Factory(:newsletter, :email => 'freddy@gmail.com')
    end

    before do
      ENV.should_receive(:[]).with('GMAIL_LOGIN').any_number_of_times.and_return('newsletter@rubyusergroup.be')
    end

    subject { NotificationMailer.new_newsletter_email(newsletter).deliver }

    its(:to) { should == ['freddy@gmail.com'] }
    its(:subject) { should == 'Ruby User Group Bern Newsletter' }
    its(:encoded) { should =~ /Du hast den Newsletter erfolgreich abonniert./ }
  end

end
