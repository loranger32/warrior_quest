# List Of Todos
---

## Make Show Stats Action Not Counting As Turn Action

Seeing stats during training should not be considered as a turn action.


## Allow player to choose his weapon in training

- Ask player which weapon to use at the start of the training ;
- Implement the choice ;
- ask agin when a new training begins.


## Improve Display Of Turns And Winning/losing Messages

Immedtiately ends training with appropriate message when :
- player is stunt ;
- player is dead ;
- all squires are stunt.

When one squire dies, it is already correctly implemented.


## Fix The Bad Method Call When Specs Are Run

There is a bad method call logging when the specs are run.
It concerns the max durability setter method on the weapon object that seems
to be called with 20 as argument. Log message is the following:

`:max_durability= was called on #<ShortSword:0x00007fad322a32d0> with the following arguments: 20.`


## Make the turns in training more OO

Improve the OO conceptation of the training process, to allow reusability in the
main game.


## Implement the multiplayer training

(...)


# TODOS DONE
---

## Add An Exit Option In General Menu _==> DONE ON 7/8/2018_

Allow player to exit game from main menu.


## Add An exit Option On Training At Avery Player Turn _==> DONE ON 7/8/2018_

Allow player to exit training each time it is his turn. Should redirect player
to main training menu.


## Add An Exit Option In The Main Training Menu _==> DONE ON 7/8/2018_

Allow player to go back to main menu from the training main menu.
