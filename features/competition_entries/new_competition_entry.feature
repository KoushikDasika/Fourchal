Feature: Create a new Competition Entry
  In order to create a new Competition Entry
  As a user
  I need to find an existing competition
  And create an entry for it

  @javascript
  Scenario: User creates a valid competition entry
    Given there exists a valid competition with challenges
    And I create a second user
    And I accept the correct competition
