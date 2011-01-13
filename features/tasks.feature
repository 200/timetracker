Feature: Tasks

Scenario: Create new task - success
When I go to the main page
And I follow "New task"
And I fill in "Name" with "Superb task"
And I fill in "Time" with "35"
And I press "Create"
Then I should be on the main page
And I should see "Task created!"
And I should see "Superb task"
And I should see "35"
And I should have 1 task record

Scenario: Delete existing task
  Given the following task record
  | name      |
  | TestTask  |
  When I go to the main page
  Then I should see "TestTask"
  When I press "delete"
  Then I should see "Task deleted!"
  And I should not see "TestTask"
  And I should have 0 task records

Scenario: Add reports to task
	Given the following task record
	| id	| name			| time	|
	| 1		| TestTask	| 20		|
	And the following report record
	| task_id	|	time	|
	| 1				| 12		|
	When I go to the 1. task page
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
