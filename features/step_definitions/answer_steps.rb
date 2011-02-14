Given /^(?:|the question "([^"]*)" has )the following answers?:$/ do |*args|
  answer_table = args.last
  question = args.first == answer_table ? nil : args.first
  answer_table.hashes.each do |row|
    attributes = {}
    attributes[:question] = model(:question, question) if question.present?
    if row['Author'].present?
      user_attributes = {:receive_email_notifications => true}
      attributes[:author] = model(:user, row['Author'], user_attributes)
    end

    put_model(:answer, row['Answer'], attributes)
  end
end
