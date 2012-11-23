Feature: Create New Competition
  In order to create a new competition
  As a user
  I need to enter the valid information

  Scenario: A Signed In User creates a valid Competition
    Given I am logged in
    And I am on the Fourchal homepage
    When I follow "Create a Competition"
    And I create a valid competition
    Then a competition should be created

  Scenario: An unsigned In User attempts to create a Competition
    Given I do not exist as a user
    And I am on the Fourchal homepage
    When I follow "Create a Competition"
    Then I should be directed to the login screen

  Scenario: A Signed In User creates an invalid competition
    Given I am logged in
    And I am on the Fourchal homepage
    When I follow "Create a Competition"
    And I create an invalid competition
    Then a competition should not be created
