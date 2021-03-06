Feature: Configuration file
  As a user
  I want to be able to specify a configuration file
  In order to tell twitchus where to load and store the data.

  Scenario: run the binary without any argumetns
    When I run `twitchus`
    Then the exit status should be 1

  Scenario: pass non-existent config file
    When I run `twitchus -c foo.yml`
    Then the exit status should be 1

  Scenario: pass an existing file
    Given a file named "config.yml" with:
    """
    foo
    """
    When I run `twitchus -c config.yml`
    Then the exit status should be 0

