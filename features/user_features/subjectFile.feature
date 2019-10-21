Feature: Resources for a specific subject
    As a "Student"
    So that I can use the resources on subject*

    Scenario: 
        Given I am logged in and a student
        And a valid teacher is registered
        And I am on the teacher subject page
        When I follow Italiano_appunti
        Then I should see Download effettuato!