Feature: As a User I can add a task

	Background:
		Given a project

	Scenario: I can add and change priority of a new task

		When I visit the project page
		And I complete the new task form
		Then I am back on the project page
		And I see the new task is last in the list
		When I click to move the new task up
		Then I am back on the project page
		And the new task is in the middle if the list
