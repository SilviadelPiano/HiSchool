Feature: Go to the "Materie" page from "Materia*" page
    As a "Student"
    So that I can go to the "Materie" page from the "Materia*" page

    Scenario: 
        Given I am logged in and a student
        And a valid teacher is registered
        And I am on the teacher subject page
        When I follow Materie
        Then I should be on the materie page