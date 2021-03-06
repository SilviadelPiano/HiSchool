Feature: LogIn without Google
    As a User
    So that I can use the app's services 

        Scenario:
            Given I am on the login page
            And a valid user
            When I fill the form correctly
                | user_email    | silvia.delpiano27@gmail.com |
                | user_password | *YukiShiro27                |
            And I press Log in
            Then I should be on the dashboard page