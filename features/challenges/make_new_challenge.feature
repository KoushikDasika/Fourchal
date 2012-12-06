Feature: Create New Challenge
  In order to create a new challenge
  As a user
  I need to enter valid information

  @javascript
  Scenario: A Signed In User adds a new Challenge to a new Competition
    Given I am logged in
    And I am on the Fourchal homepage
    When I follow "Create a Competition"
    And I fill in the new competition form correctly with the name "New competition"
    And I add challenges to the competition form with the following values:
      | title | description | validation | badge | prize    | points |
      | Run   | running     | super      | green | stickers | 10     |
      | Walk  | walking     | purple     | green | stickers | 10     |
      | Jump  | jumping     | green      | green | stickers | 10     |
    And I click the "Save" button
    And I should see the competition information
    And I should see the challenges information:
      | title | description | validation | badge | prize    | points |
      | Run   | running     | super      | green | stickers | 10     |
      | Walk  | walking     | purple     | green | stickers | 10     |
      | Jump  | jumping     | green      | green | stickers | 10     |
