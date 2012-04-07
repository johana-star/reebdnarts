Feature: beer catalog
As a customer
I want to be able to view beer information
So I can learn about beers currently available and those not on tap.

	Scenario: display which beers are on tap
	Given we have the following beers in our catalog:
	 | beer              | on tap? |
	 | American IPA      | yes     |
	 | Belgian Blond Ale | yes     |
	 | Belgian Wit       | yes     |
	 | American Porter   | no      |
	 | Hefeweizen        | no      |
	 | American Pale Ale | yes     |
	When I am on the homepage
	Then I should see the following beers on tap:
	 | beer              |
	 | American IPA      |
	 | Belgian Blond Ale |
	 | Belgian Wit       |
	 | American Pale Ale |

	Scenario: display which beers are on tap first.

	Scenario: Indicate when a beer is unavailable.
