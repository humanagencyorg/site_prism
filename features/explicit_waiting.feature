Feature: Waiting for Elements

  I want to be able to explicitly wait for an element
  In order to interact with the element once it is ready

  Scenario: Wait for Element - Positive
    When I navigate to the home page
    And I wait for the element that takes a while to appear
    Then the slow element appears
    And I am not made to wait for the full default duration

  Scenario: Wait for Element - Negative
    When I navigate to the home page
    And I wait for a short amount of time for an element to appear
    Then the element I am waiting for doesn't appear in time

  Scenario: Wait for Element - Exceptions - Positive
    Given exceptions are configured to raise on wait_fors
    When I navigate to the home page
    And I wait for the element that takes a while to appear
    Then the slow element appears
    And I am not made to wait for the full default duration

  Scenario: Wait for Element - Exceptions - Negative
    Given exceptions are configured to raise on wait_fors
    When I navigate to the home page
    Then an exception is raised when I wait for an element that won't appear

  Scenario: Wait for No Element - Positive
    When I navigate to the home page
    And I wait for the element that takes a while to disappear
    Then the removing element disappears
    And I am not made to wait for the full default duration

  Scenario: Wait for No Element - Negative
    When I navigate to the home page
    And I wait for a short amount of time for an element to disappear
    Then the element I am waiting for doesn't disappear in time

  Scenario: Wait for No Element - Exceptions - Positive
    Given exceptions are configured to raise on wait_fors
    When I navigate to the home page
    And I wait for the element that takes a while to disappear
    Then the removing element disappears

  Scenario: Wait for No Element - Exceptions - Negative
    Given exceptions are configured to raise on wait_fors
    When I navigate to the home page
    Then an exception is raised when I wait for an element that won't vanish

  Scenario: Wait for Visibility of element - Default Timeout
    When I navigate to the home page
    And I wait until a particular element is visible
    Then the previously invisible element is visible
    And I am not made to wait for the full default duration

  Scenario: Wait for Visibility of element - Overridden Timeout
    When I navigate to the home page
    And I wait for a specific amount of time until an element is visible
    Then the previously invisible element is visible
    And I am not made to wait for the full overridden duration

  Scenario: Wait for Visibility of element - Negative Test
    When I navigate to the home page
    Then I get a timeout error when I wait for an element that never appears

  Scenario: Wait for Invisibility of element - Default Timeout
    When I navigate to the home page
    And I wait for an element to become invisible
    Then the previously visible element is invisible

  Scenario: Wait for Invisibility of element - Overridden Timeout
    When I navigate to the home page
    And I wait a specific amount of time for a particular element to vanish
    Then the previously visible element is invisible

  Scenario: Wait for Invisibility of element - Negative Test
    When I navigate to the home page
    Then I get a timeout error when I wait for an element that never vanishes

  Scenario: Wait for Invisibility of element - Non-Existent Element
    When I navigate to the home page
    Then I am not made to wait to check a nonexistent element for invisibility

  Scenario: Wait for Invisibility of element - Non-Existent Section
    When I navigate to the home page
    And I remove the parent section of the element
    Then an error is thrown when waiting for an element in a vanishing section

  Scenario: Element Is Not Automatically Waited For
    When I navigate to the home page
    Then the slow element is not waited for
    And implicit waits should not be enabled

  Scenario: Elements Collections Are Not Automatically Waited For
    When I navigate to the home page
    Then the slow elements are not waited for
    And implicit waits should not be enabled

  Scenario: Section Is Not Automatically Waited For
    When I navigate to the home page
    Then the slow section is not waited for
    And implicit waits should not be enabled

  Scenario: Sections Collections Are Not Automatically Waited For
    When I navigate to the home page
    Then the slow sections are not waited for
    And implicit waits should not be enabled
