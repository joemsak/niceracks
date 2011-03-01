@performances
Feature: Performances
  In order to have performances on my website
  As an administrator
  I want to manage performances

  Background:
    Given I am a logged in refinery user
    And I have no performances

  @performances-list @list
  Scenario: Performances List
   Given I have performances titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of performances
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @performances-valid @valid
  Scenario: Create Valid Performance
    When I go to the list of performances
    And I follow "Add New Performance"
    And I fill in "Venue Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 performance

  @performances-invalid @invalid
  Scenario: Create Invalid Performance (without venue_name)
    When I go to the list of performances
    And I follow "Add New Performance"
    And I press "Save"
    Then I should see "Venue Name can't be blank"
    And I should have 0 performances

  @performances-edit @edit
  Scenario: Edit Existing Performance
    Given I have performances titled "A venue_name"
    When I go to the list of performances
    And I follow "Edit this performance" within ".actions"
    Then I fill in "Venue Name" with "A different venue_name"
    And I press "Save"
    Then I should see "'A different venue_name' was successfully updated."
    And I should be on the list of performances
    And I should not see "A venue_name"

  @performances-duplicate @duplicate
  Scenario: Create Duplicate Performance
    Given I only have performances titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of performances
    And I follow "Add New Performance"
    And I fill in "Venue Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 performances

  @performances-delete @delete
  Scenario: Delete Performance
    Given I only have performances titled UniqueTitleOne
    When I go to the list of performances
    And I follow "Remove this performance forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 performances
 