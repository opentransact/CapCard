Feature: Apply for card
  In order to use a card
  As a user
  I want to apply for a card
  
  Scenario: normal signup
    Given I am on the homepage
    When I fill in "email" with "bob@example.com"
    And I fill in "name" with "Bob Smith"
    And I press "Apply"
    Then I should see "Your card has hereby been issued"
    And I should see "Bob Smith"
    And I should receive an email
    
    When I look at card in database
    
    Then card should have "Bob Smith" as name
    And card should have "bob@example.com" as email

    And I should see card number

  Scenario: signup and login via credentials email
    Given I signup
    And I press "Logout"
    
    When I open the email
    Then I should see "Here is your new CapCard" in the email subject
    And I should see card cap url in the email body
    And I should see card number in the email body
    And I should see card pin in the email body
    
    When I click the first link in the email
    Then I should see "You have been logged in to use your card"
    And I should see card number
    
  Scenario: signup and login via number and pin
    Given I signup
    And I press "Logout"

    Given I am on the homepage
    When I fill in card number
    And I fill in pin
    And I press "Login"
    
    Then I should see "You have been logged in to use your card"
    And I should see card number
      