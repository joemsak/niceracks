@ladies
Feature: Ladies
  In order to have ladies on my website
  As an administrator
  I want to manage ladies

  Background:
    Given I am a logged in refinery user
    And I have no ladies

  @ladies-list @list
  Scenario: Ladies List
   Given I have ladies titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of ladies
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @ladies-valid @valid
  Scenario: Create Valid Lady
    When I go to the list of ladies
    And I follow "Add New Lady"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 lady

  @ladies-invalid @invalid
  Scenario: Create Invalid Lady (without name)
    When I go to the list of ladies
    And I follow "Add New Lady"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 ladies

  @ladies-edit @edit
  Scenario: Edit Existing Lady
    Given I have ladies titled "A name"
    When I go to the list of ladies
    And I follow "Edit this lady" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of ladies
    And I should not see "A name"

  @ladies-duplicate @duplicate
  Scenario: Create Duplicate Lady
    Given I only have ladies titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of ladies
    And I follow "Add New Lady"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 ladies

  @ladies-delete @delete
  Scenario: Delete Lady
    Given I only have ladies titled UniqueTitleOne
    When I go to the list of ladies
    And I follow "Remove this lady forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 ladies
 