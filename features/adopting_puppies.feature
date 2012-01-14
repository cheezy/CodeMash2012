@focus
Feature: Adopting Puppies

  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Background:
    Given I am on the puppy adoption site

  Scenario: Adopt a puppy
    When I click the View Details button
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I enter "Cheezy" in the name field
    And I enter "123 Main Street" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay type dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Adopting a puppy using a table
    When I click the View Details button
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I checkout using:
    | name   | address     | email              | pay_type    |
    | Cheezy | 123 Main St | cheezy@example.com | Credit card |
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Adopting a puppy with default data
    When I click the View Details button
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I checkout
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Adopting a puppy using partial default data
    When I click the View Details button
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I checkout using a Check
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Thank you message should be displayed
    When I complete the adoption of a puppy
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Name is required when checking out
    When I checkout leaving the name field blank
    Then I should see the error message "Name can't be blank"
