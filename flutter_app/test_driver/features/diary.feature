Feature: Food diary
  In order
  As an existing user
  I want to easily log food records

  Background:
    Given the user BOB logs IN
    And the user navigates to DIARY page
    Then the app bar title is "Diary" # is this necessary???

  Scenario: ???
    #Given the user BOB logs IN
    #And the user navigates to DIARY page
    When the user logs food APPLE to meal #{INT}
    Then the diary contains food APPLE

  # the diary is EMPTY|NON-EMPTY
  # And the user swipes LEFT|RIGHT

  Scenario: The user views a historical date
    #Given the user BOB logs IN
    #And the user navigates to DIARY page
    When the user opens calendar, go to {int day}
    Then expect day to be {day}


    # navigation feature:
  # Given the user BOB logs IN
  # When the user navigates to Diary
  # Then the app bar title is "TEXT"
