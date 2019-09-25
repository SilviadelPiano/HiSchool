Feature: Publish a post
    As a "Teacher"
    So that I can communticate with my "Student" s and assign homework to them

    Scenario:
        Given I am logged in and a teacher
        And I am on the new post page
        When I fill the form correctly
            | description       | Post1 |
            | post_school_class | 2LS   |
            | post_school       | Peano |
        And I press Pubblica
        Then I should be on the dashboard page