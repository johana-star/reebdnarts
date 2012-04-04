Feature: language selector
	As a customer
	I want to be able to view the site in Chinese or English
	So I can read about beer in the language which I am most fluent.

	@javascript
	Scenario: Selecting English language content
		Given I am on the homepage
		When I follow "EN"
		Then I should be on the homepage
		And I should see "This is English content."
		And I should see "这是中国的内容。" within ".hidden"
		And I should see "EN | ZH"

	@javascript		
	Scenario: Selecting Chinese language content
		Given I am on the homepage
		When I follow "ZH"
		Then I should be on the homepage
		And I should see "这是中国的内容。"
		And I should see "This is English content." within ".hidden"
		And I should see "EN | ZH"