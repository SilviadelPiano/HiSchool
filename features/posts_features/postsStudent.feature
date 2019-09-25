Feature: Posts seen by "Student"
    As a "Student"
    So that I can see the posts all my "Teacher" s made

    Scenario: 
        Given I am logged in and a student
        And posts about my classroom are created
        And I am on the dashboard page
        Then I should see [Italiano
        And I should see [Storia