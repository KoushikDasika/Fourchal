Feature: Create a new Competition Entry
  In order to create a new Competition Entry
  As a user
  I need to find an existing competition
  And create an entry for it

  @javascript
  Scenario: User creates a valid competition entry
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
    And I sign out
    And I create a second user
    And I accept the correct competition

