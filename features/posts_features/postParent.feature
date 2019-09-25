Feature: Posts seen by a "Parent"
    As a "Parent"
    So that I can be updated on my child's scholastic situation

    Scenario: 
        Given I am logged in and a parent
        And posts about the classroom of my child are created
        And I am on the dashboard page
        Then I should see [Italiano
        And I should see [Storia