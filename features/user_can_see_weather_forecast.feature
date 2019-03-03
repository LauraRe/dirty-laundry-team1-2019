@api_call

Feature: User can see weather forecast

    As a user
    In order to plan my washing days
    I would like to know the weather forecast

    Background:
        Given we have 1 laundry

    Scenario: User can see weather forecast on the page
        Given I am on the "Landing" page
        Then I should see "scattered clouds 1 Friday"
        And I should see "few clouds 4 Saturday"
        And I should see "snow 1 Sunday"
        And I should see "light rain 1 Monday"
        And I should see "light rain 3 Tuesday"