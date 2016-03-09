# 2. When articles are merged, the merged article should contain the text of both previous articles.
# 3. When articles are merged, the merged article should have one author (either one of the authors of the original article).
# 4. Comments on each of the two original articles need to all carry over and point to the new, merged article.
# 5. The title of the new article should be the title from either one of the merged articles.

Feature: Merge Articles
  As a blog administrator
  I want to be able to merge articles together
  

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
      | id | title      | body                            |
      |  3 | Eggs       | medium heat, oil, salt, pepper. |
      |  4 | Spam       | medium high heat.               |
    And the following comments exist:
      | id | author | user_id | body  | article_id |
      |  1 | Fox    |       1 | Arm   |          3 |
      |  2 | Pat    |       2 | Dave  |          4 |

  Scenario: Successfully Merge Articles
    Given I am on the articles page for "Eggs"
    Then I should see merge_with
    When I fill in "merge_with" with "4"
    And I press "Merge With This Article"
    Then the article "Eggs" should have body "medium heat, oil, salt, pepper. medium high heat."
    And the comment "Dave" should belong to "Eggs" 
    And I should be on the articles page for "Eggs"
    
#   Scenario: Receive Error when Trying to Merge With Non-Exisiting Articles
#     Given I am on the articles page for "Eggs"
#     Then I should not see merge_with
#     When I fill in "merge_with" with "7"
#     Then the article "Eggs" should have body "medium heat, oil, salt, pepper."
#     And I should be on the articles page for "Eggs"
#     And I should see a helpful error message
    
#   Scenario: Receive Error when Trying to Merge with Self
#     Given I am on the articles page for "Eggs"
#     Then I should see merge_with
#     When I fill in "merge_with" with "3"
#     Then the article "Eggs" should have body "medium heat, oil, salt, pepper."
#     And I should be on the articles page for "Eggs"
#     And I should see a helpful error message