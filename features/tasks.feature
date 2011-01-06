Feature: Tasks

Scenario: Create new task - success
When I go to the index page
And I follow "New task"
And I fill in "name" with "Superb task"
And I fill in "time" with "3.5"
And I press "Create"
Than I should be on the index page
And I should see "Task created!"
And I should see "Superb task"
And I shiuld see "3.5"
And I should have 1 task record
