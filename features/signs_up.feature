@javascript
Feature: new user registration

  Background:
    When I go to the new user registration page
    And I fill in "Username" with "ohai"
    And I fill in "Email" with "ohai@example.com"
    And I fill in "user_password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I press "Create my account"
    Then I should be on the getting started page
    And I should see "Welcome"
    And I should see "Who are you?"
    And I should see "What are you into?"

  Scenario: new user goes through the setup wizard
    And I fill in the following:
      | profile_first_name | O             |
    And I follow "awesome_button"

    Then I should be on the aspects page
    And I should not see "awesome_button"

  Scenario: new user skips the setup wizard
    When I follow "awesome_button"
    Then I should be on the aspects page
