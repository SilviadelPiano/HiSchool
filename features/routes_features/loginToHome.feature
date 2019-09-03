Feature: Go to the "Home" page from the "LogIn" page
    As a User
    So that I can return to the "Home" page without logging in

    Scenario:
        Given I am on the login page
        When I follow Home
        Then I should be on the home page

    # TODO: Add perhaps failing Scenario when doing the Error story