Feature: Logout
    As a User
    So that I can stop using the app's services

        Scenario: 
            Given I am logged in 
            And I am on the dashboard page
            When I follow Logout
            Then I should be on the home page