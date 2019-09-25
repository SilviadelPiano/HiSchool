Feature: Posts seen by "Teacher"
    As a "Teacher"
    So that I can see understand the workload my "Student" s have    

    Scenario:
        Given I am logged in and a teacher
        And another teacher exists
        And I created a post
        And I am on the dashboard page
        Then I should see [Italiano
        And I should see [Storia