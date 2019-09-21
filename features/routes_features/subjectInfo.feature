Feature: Subject info

    As a "Student"
    So that I can have more information about a subject

    Scenario:
        Given I am logged in and a student
        And a valid teacher is registered
        And I am on the materie page
        When I follow Italiano
        Then I should be on the teacher subject page