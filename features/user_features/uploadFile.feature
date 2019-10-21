Feature: Upload a file
    As a "Teacher"
    So that I can upload a file

    Scenario:
        Given I am logged in and a teacher
        And I am on the dashboard page
        When I fill the form correctly
            | g_file_title    | Italiano_test.txt           |
            | g_file_path     | /home/biar/Upload/test.txt  |

        And I press Carica il file
        Then I should see Caricamento effettuato