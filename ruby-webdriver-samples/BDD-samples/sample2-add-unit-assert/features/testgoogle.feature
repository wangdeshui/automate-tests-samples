Feature: Test Google

  Scenario: home page
    Given I am in google home page
    And I have input "Hana"
    When I click Submit
    Then the page result should include "Hana"

   @jack
  Scenario: home page tag
    Given I am in google home page
    And I have input "Jack"
    When I click Submit
    Then the page result should include "Jack"