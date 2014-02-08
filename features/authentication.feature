Feature: User authentication
  In order to protect users data from unauthorized access
  An anonymous user
  Should not have access to the application

  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to register
    And I fill in 'user_email' with "<email>"
    And I fill in 'user_fullname' with "<fullname>"
    And I fill in 'user_region' with "<region>"
    And I fill in 'user_password' with "<password>"
    And I fill in 'user_password_confirmation' with "<password>"
    And I press "Sign up"
    Then I should see "<fullname> (<email>), <region>"

    Examples:
      | email           | fullname | password | region |
      | foo@example.com | Foo Bar  | secret   | lorem  |
      | bar@example.com | Bar Foo  | secret   | ipsum  |


  Scenario: Willing to edit my account
    Given I am a new, authenticated user
    When I want to edit my profile
