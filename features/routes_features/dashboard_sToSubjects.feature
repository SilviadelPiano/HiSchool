Feature: Materie
    As a "Student"
    So that I can see the subjects teached at school

    Scenario: 
        Given I am logged in and a student
        And I am on the dashboard page
        When I follow Materie
        Then I should be on the materie page