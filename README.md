
# Battleship

Welcome to our version of the Battleship project. We appreciate you taking the time to enjoy our game.
People have said that our game is
> Fun
## Setup

In order to play the game, please clone our repo with

```ruby git@github.com:jwgalvin/Battleship.git```

Once you have cloned the repo, enter the directory you saved the repo to and enter:

```cd Battleship```

```ruby battleship_runner.rb```

This will bring you into the main menu of the Game.

### Playing the Game
Press "p" to play or "q" to quit.


Once in the game you will need to place your ships.

- Input locations in ascending order

    -ie "a1 a2 a3" or "a1 b1 c1"

Once you have input your ships, you will choose cells to fire upon.

- input a single cell.
    -ie "a1" or "b4"

The computer will then choose to fire upon a cell.

The game ends when either all of the player or computers ships have been sunk.

Input "p" to play again or "q" to quit!

```
====Directory====

___Class Files___
ship.rb   : manages the health of our ships
cell.rb   : manages what each cell contains
board.rb  : manages the rendering and valid location  on our board
game.rb   : manages the functionality of the interactions within a game

___Spec Files___
ship_spec.rb  : manages the tests for our ships
cell_spec.rb  : manages the tests for our cells
board_spec.rb : manages the tests for our boards
games_spec.rb : manages the tests for our games

___Additional Files___
battleship_runner.rb : runs the game
README.md            : explains what is in the file

___Known Bugs/Errors___
player is not notified when firing on a previously fired upon location 
```

We hope you enjoy our Game!
