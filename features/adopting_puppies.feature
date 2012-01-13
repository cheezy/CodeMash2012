Feature: Adopting Puppies

  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Background:
    Given I am on the puppy adoption site

  Scenario: Adopt a single puppy
    When I press the View Details button for "Brook"
    And I press the Adopt Me button
    And I press the Complete the Adoption button
    And I enter "Cheezy" in the name field
    And I enter "123 Main Street" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay type dropdown
    And I press the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Using a table for our data
    When I press the View Details button for "Brook"
    And I press the Adopt Me button
    And I press the Complete the Adoption button
    And I checkout with
      | name   | address         | email             | pay_type       |
      | Mickey | 555 Disney Lane | mickey@disney.com | Purchase order |
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Using partial default data
    When I press the View Details button for "Brook"
    And I press the Adopt Me button
    And I press the Complete the Adoption button
    And I checkout using a Credit card
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Using all default data
    When I press the View Details button for "Brook"
    And I press the Adopt Me button
    And I press the Complete the Adoption button
    And I checkout using default data
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Thank you message should be display when adoption is complete
    When I complete the adoption of a puppy
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Name is a required field when checking out
    When I checkout leaving the Name blank
    Then I should see the error message "Name can't be blank"


