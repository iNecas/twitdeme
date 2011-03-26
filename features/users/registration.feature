Feature: Users registration
  
  Scenario: Successful registration
    Given I am on the register page
    When I fill in the following:
      | Username       | user   |
      | Password       | secret |
      | Password Again | secret |
    And I press "Register"
    Then I should see "You have been registered successfully"
    
  Scenario: Wrong registration
    Given I am on the register page
    When I fill in the following:
      | Username       | user   |
      | Password       | secret |
      | Password Again | sekret |
    And I press "Register"
    Then I should not see "You have been registered successfully"
    And I should see "Password doesn't match confirmation"

