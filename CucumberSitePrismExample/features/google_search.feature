Feature: Users must be able to search for content using Google.
 
Scenario Outline: Search for a term.

Given I have started google "search page"

When I entered "<search_data>" in search field 
 
And I clicked in "search button"

Then Should more than <headers> result headers

Examples:
| search_data  | headers   |
| America      | 5         |