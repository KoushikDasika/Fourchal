Feature: Edit Competition
  As a registered user of the website
  I want to edit the details of my competition
  so I can change the name

  @javascript
  Scenario: I am signed in and edit my competition
    Given I am logged in
    And I am on the Fourchal homepage
    And I follow "Create a Competition"
    And I fill in the new competition form correctly with the name "New Competition"
    And I click the "Save" button
    And I follow "Profile"
    And I follow "New Competition"
    And I follow "Edit"
    And I fill in the edit competition form correctly with the name "Editted Competition"
    And I click the "Save" button
    And I follow "Profile"
    And I should see the name changed to "Editted Competition"
    And I follow "Editted Competition"
    And I should see the name changed to "Editted Competition"
