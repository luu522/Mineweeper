Feature: MineSweeper
    As a user
    To define the board display will use:
    "o" hidden cell
    "*" mine
    "!" mined symbol
    "?" uncertain symbol
    "0" empty cell
    "n" cell with number

Background:
Given a user opens the app


Scenario: Default board
Then the board should be an "8" x "8"


# ---------------------------------------FINISH GAME---------------------------------------

Scenario: If the user reveals a cell that has a mine the game finishes
Given the user loads the following mockData: "ooo-ooo-o*o"
When the user unleash the cell "3-2"
Then the cell <3-2> shows the "mine symbol"
And the user should lose the game


# ---------------------------------------WIN GAME-------------------------------------------

Scenario: Win the game revealing all the cells that do not contain mines
Given the user loads the following mockData: "***-ooo-***"
When the user reveals the cell "2-1"
And the user reveals the cell "2-2"
And the user reveals the cell "2-3"
Then the <gameStatus> is set to "YOU WIN"


# ---------------------------------------REVEAL CELLS---------------------------------------

Scenario: Revealing an empty cell
Given the user loads the following mockData: "ooo-o0o-ooo"
When the user reveals the cell "2-2"
Then the cell "2-2" shows a "0"
Given the user loads the following mockData: "ooo-o0o-ooo"


Scenario: Revealing an empty cell with no mines in its surroundings
Given the user loads the following mockData: "*****-*ooo*-*ooo*-*ooo*-*****"
"""
*****
*ooo*
*ooo*
*ooo*
*****
"""
When the user reveals the cell "3-3" and is empty
"""
*****
*ooo*
*ooo*
*ooo*
*****
"""


Scenario Outline: Pressing a cell with no mine, showing the number of sorrounding mines
Given the user loads the following mockData: "<mock>"
When the user reveals the cell "2-2"
Then the cell <3-2> shows a "<adjacentMines>"

Examples:
    |      mock      |  adjacentMines   |
    |   ooo-ooo-ooo  |        0         |
    |   *oo-ooo-ooo  |        1         |
    |   **o-ooo-ooo  |        2         |
    |   ***-ooo-ooo  |        3         |
    |   ***-*oo-ooo  |        4         |
    |   ***-*o*-ooo  |        5         |
    |   ***-*o*-*oo  |        6         |
    |   ***-*o*-**o  |        7         |
    |   ***-*o*-***  |        8         |


# ---------------------------------------MARKING CELLS-----------------------------------------

Scenario: Mark the cell where the user thinks there is a mine with a mined symbol
Given the user marks the cell "2-2"
Then the "cell" is marked with the mined symbol "!"


Scenario: Mark the cell where the user doesn't know if there is something with an uncertain symbol
Given the cell "2-3" shows a mined symbol "!"
When the user marks the cell "2-3"
Then the cell "2-3" is marked with a unertainty symbol "?"


# ---------------------------------------MOUSE SCENARIOS---------------------------------------

Scenario:  Mark the cell where the user thinks there is a mine with a mined symbol with a mouse
Given the user right-clicks the cell "2-2"
Then the "cell" is marked with a mined symbol "!"


Scenario: Set an uncertain symbol with a mouse when there is already a mined symbol
Given the user right-clicks the cell "2-3"
When the cell "2-3" is marked with a unertainty symbol "?"


Scenario: Removing the mined symbol from a cell with a mouse
Given a cell "3-2" shows the mined symbol "!"
When the user left-clicks the cell "3-2"
Then the mined symbol "!" should be gone 


Scenario: Removing the question mark from a cell with a mouse
Given a "cell" shows a question mark "?"
When the user left-clicks the "cell"
Then the question mark "?" should be gone


# ---------------------------------------MINE COUNTER SCENARIOS-----------------------------------
# COUNTER NAME IS GONNA BE CHANGED - IN PROCESS

Scenario: Set the number of mined symbols in the counter that we can use in the game
Given the user loads the following mockData: "**o-ooo-oo*"
Then then the "counter" should set to "3"


Scenario: Substract 1 in the counter everytime the user marks a cell with a mined symbol
Given the user loads the following mockData: "**o-ooo-oo*"
When the user marks the cell "1-1" with a "minedSymbol"
Then then the "counter" should set to "2"


Scenario: Add 1 in the counter everytime the user removes or changes a cell with a mined symbol
Given the user loads the following mockData: "**o-ooo-oo*"
When the user removes the "minedSymbol" of the cell "1-1"
Then then the "counter" should set to "3"

# ---------------------------------------RESET GAME SCENARIOS-----------------------------------
