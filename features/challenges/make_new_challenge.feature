Feature: Create New Challenge
  In order to create a new challenge
  As a user
  I need to enter valid information

  Scenario: A Signed In User adds a new Challenge to a new Competition
    Given I am logged in
    And I am on the Fourchal homepage
    When I follow "Create a Competition"
    And I fill in the new competition form correctly with the name "New competition"
    And I should see the competition information
