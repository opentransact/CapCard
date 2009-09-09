Given /^I signup$/ do
  Given 'I am on the homepage'
  When 'I fill in "email" with "bob@example.com"'
  When 'I fill in "name" with "Bob Smith"'
  When 'I press "Apply"'
  When 'I look at card in database'
end

When /^I look at card in database$/ do
  @card=Card.last
end

When /^I fill in card number$/ do
  When "I fill in \"number\" with \"#{@card.number}\""
end

When /^I fill in pin$/ do
  When "I fill in \"pin\" with \"#{@card.pin}\""
end

Then /^card should have "(.*)" as name$/ do |name|
  @card.name.should==name
end

Then /^card should have "(.*)" as email$/ do |email|
  @card.email.should==email
end

Then /^I should see card number$/ do
  Then "I should see \"#{@card.number[0..3]}\""
  Then "I should see \"#{@card.number[4..7]}\""
end

Then /^I should see card cap url in the email body$/ do 
  Then "I should see \"http://capcard.heroku.com/cap/#{@card.key}\" in the email body"
end

Then /^I should see card pin in the email body$/ do 
  Then "I should see \"#{@card.pin}\" in the email body"
end

Then /^I should see card number in the email body$/ do 
  Then "I should see \"#{@card.number}\" in the email body"
end

