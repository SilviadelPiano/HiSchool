Feature: "Teacher"'s posts
    As a "Student"
    So that I can have a focus on the specific subject*

    Scenario: 
        Given I am logged in and a student
        And posts about my classroom are created
        And I am on the materie page
        And I follow Italiano
        Then I should be on the teacher subject page
        And I should see [Italiano
        And I should not see [Storia