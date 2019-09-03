Feature: Go to the "LogIn" page from the "Home" page
    As a User
    So that I can LogIn

        Scenario:
            Given I am on the home page
            When I follow Login
            Then I should be on the login page

        # TODO: Add perhaps failing Scenario when doing the Error story