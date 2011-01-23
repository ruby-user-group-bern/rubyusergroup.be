When /^(.*) in the "([^\"]*)" section$/ do |action, title|
  within :xpath, "//*[(li|h1|h2|h3|h4|h5|h6|legend|caption)/descendant-or-self::*[contains(text(), '#{title}')]]" do
    When action
  end
end

When /^(.*) in the "([^\"]*)" row$/ do |action, title|
  within :xpath, "//*[(th|td)/descendant-or-self::*[contains(text(), '#{title}')]]" do
    When action
  end
end
