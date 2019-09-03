Feature: Go to the "SignUp" page from the "Home" page
    As a User
    So that I can sign sign up 

        Scenario: 
            Given I am on the home page
            When I follow Sign Up
            Then I should be on the sign-up page

        # TODO: Add perhaps failing Scenario when doing the Error story