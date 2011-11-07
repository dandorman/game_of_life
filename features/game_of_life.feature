Feature: Game of Life
  In order to learn more about BDD
  As a developer
  I want to test-drive an implementation of Conway's Game of Life

  Scenario: Any live cell with fewer than two live neighbors dies, as if caused by under-population.
    Given the game board looks like this:
      | # | # | . |
      | . | . | . |
      | . | . | . |
    When the game advances
    Then the game board should look like this:
      | . | . | . |
      | . | . | . |
      | . | . | . |

  Scenario: Any live cell with two or three live neighbors lives on to the next generation.
    Given the game board looks like this:
      | # | # | # |
      | . | . | # |
      | . | . | . |
    When the game advances
    Then the game board should look like this:
      | . | # | # |
      | . | . | # |
      | . | . | . |

  Scenario: Any live cell with more than three live neighbors dies, as if by overcrowding.
    Given the game board looks like this:
      | # | # | # |
      | # | # | # |
      | # | # | # |
    When the game advances
    Then the game board should look like this:
      | # | . | # |
      | . | . | . |
      | # | . | # |

	Scenario: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    Given the game board looks like this:
      | # | # | . |
      | # | . | . |
      | . | . | . |
    When the game advances
    Then the game board should look like this:
      | # | # | . |
      | # | # | . |
      | . | . | . |
