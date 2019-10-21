Feature: Remove a file
    As a "Teacher"
    So that I can remove files

    Scenario:
        Given I am logged in and a teacher
        And I am on the dashboard page 
        When I click the link Cancella
        Then I should see Il file è stato cancellato con successo!