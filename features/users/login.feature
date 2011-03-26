Feature: Login to the system
  
  Scenario: Wrong credentials
    Given I am on the login page
    When I fill in "Username" with "user"
    And I fill in "Password" with "password"
    And I press "Login"
    Then show me the page
    Then I should see "Wrong username or password"

  Scenario: Correct credentials
    Given user "user"
    And I am on the login page
    When I fill in "Username" with "user"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should see "Welcome to twitterific"

