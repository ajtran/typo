# 1. A non-admin cannot merge articles.

Feature: No Merge Article For Non Admins
  As an non admin
  I should not be able to merge articles
  So I can't mess up other people's articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel as a non admin
    And the following articles exist:
      | id | title      | body                                |
      |  3 | Eggs       | medium high head, oil, salt, pepper |
      
  Scenario: I do not have the option to merge articles
    Given I am on the articles page for "Eggs"
    Then I should not see merge_with