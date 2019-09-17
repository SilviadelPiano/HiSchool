Feature: SignUp
    As a User
    So that I can use the app's services
    Bisogna aggiungere il supporto per la select per la data

        Scenario: 
            Given I am on the sign-up page
            When I fill in the following:
                | nome              | Silvia                      |
                | cognome           | del Piano                   |
                | codice fiscale    | DLPSLV97L67H501J            |
                | città di nascita  | Roma                        |
                | email             | silvia.delpiano27@gmail.com |
                | password          | *YukiShiro27                |
                | conferma password | *YukiShiro27                |
                And I click radio button user_sex_f
                And I click radio button user_roles_student_student
                And I press Registrati
            Then I should see Hai quasi finito!