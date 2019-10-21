Feature: Download a file
    As a "Teacher"
    So that I can download files

    Scenario: 
        Given I am logged in and a teacher
        And I am on the dashboard page
        When I click the link Download
        Then I should see Download effettuato!