Feature: Test Google

  Scenario: home page
    Given I am in google home page
    And I have input "Hana"
    When I click Submit
    Then the page result should include "Hana"