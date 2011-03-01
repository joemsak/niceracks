@photos
Feature: Photos
  In order to have photos on my website
  As an administrator
  I want to manage photos

  Background:
    Given I am a logged in refinery user
    And I have no photos

  @photos-list @list
  Scenario: Photos List
   Given I have photos titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of photos
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @photos-valid @valid
  Scenario: Create Valid Photo
    When I go to the list of photos
    And I follow "Add New Photo"
    And I fill in "Caption" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 photo

  @photos-invalid @invalid
  Scenario: Create Invalid Photo (without caption)
    When I go to the list of photos
    And I follow "Add New Photo"
    And I press "Save"
    Then I should see "Caption can't be blank"
    And I should have 0 photos

  @photos-edit @edit
  Scenario: Edit Existing Photo
    Given I have photos titled "A caption"
    When I go to the list of photos
    And I follow "Edit this photo" within ".actions"
    Then I fill in "Caption" with "A different caption"
    And I press "Save"
    Then I should see "'A different caption' was successfully updated."
    And I should be on the list of photos
    And I should not see "A caption"

  @photos-duplicate @duplicate
  Scenario: Create Duplicate Photo
    Given I only have photos titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of photos
    And I follow "Add New Photo"
    And I fill in "Caption" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 photos

  @photos-delete @delete
  Scenario: Delete Photo
    Given I only have photos titled UniqueTitleOne
    When I go to the list of photos
    And I follow "Remove this photo forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 photos
 