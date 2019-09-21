Feature: Go to the "Dashboard_*" page
    As a User
    So that I can go to the "Dashboard_*" whenever I need it

    Scenario: 
        Given I am logged in and a student
        And I am on the materie page
        When I follow Dashboard
        Then I should be on the dashboard page

    Scenario:
        Given I am logged in and a student
        And a valid teacher is registered
        And I am on the teacher subject page
        When I follow Dashboard
        Then I should be on the dashboard page