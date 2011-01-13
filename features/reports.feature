Feature: Reports

Background:	
	Given the following task record
	| id	| name			| time	|
	| 1		| TestTask	| 20		|
	And the following report record
	| task_id	|	time	|
	| 1				| 12		|
	When I go to the 1. task page

Scenario: Add reports to task
	Then I should see "TestTask"
	And I should see "Estimation: 20"
	And I should see "Current time: 12"
	And I should see "12" within ".reports"
	When I follow "Create report"
	And I fill in "Time" with "3"
	And I press "Create"
	Then I should be on the 1. task page
	And I should see "Report created"
	And I should see "Current time: 15"
	And I should see "3" within ".reports"

Scenario: Delete report from task
	And I press "Delete report"
	Then I should see "Report deleted"
	And I should see "Current time: 0"
	And I should not see "12" within ".reports"
	And I should have 0 report records
