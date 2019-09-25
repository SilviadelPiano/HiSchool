Feature: Go to the "NewPost" page from the "Dashboard_t" page
    As a "Teacher"
    So that I can communticate with my "Student" s and assign homework to them   

    Scenario: 
        Given I am logged in and a teacher
        And I am on the dashboard page
        When I follow Nuovo Post
        Then I should be on the new post page