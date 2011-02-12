Given /^the following users:$/ do |user_table|
  user_table.hashes.each do |row|
    attributes = {}
    attributes[:id] = row['ID'].to_i if row['ID'].present?
    attributes[:email] = row['E-Mail'] if row['E-Mail'].present?
    attributes[:email] = "#{row['Username']}@gmail.com" if row['Username'].present?
    put_model(:user, row['Username'], attributes)
  end
end

Then /^I should see the following users:$/ do |user_table|
  actual_users = all('#members li').map do |user|
    {
      'Username' => user.find('h4').plain_text
    }
  end
  user_table.diff! actual_users
end
