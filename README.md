# MadPea Take Home

![](https://github.com/ChaseTramel/MadPea-Take-Home/blob/main/DoorOpening.gif?raw=true)

## Original Text of Requirements

### Items Provided:

- Sliding Door 
- Door Frame
- Keypad
- Sounds
- HUD

### Description:

- When the player walks close (5m) to the door they receive the message: "Type in key".
- When the player types in the correct combination (150) on the keypad  the sliding door opens smoothly and closes again after 6 seconds.
- Keys play the beep sound when pressed.
- Door plays the door sound when moving.
- After the door opened the red element on the attached HUD turns blue. 

## My Interpretation of the Requirements

- Player is within 5m

  - Triggered: Send player a message

- Player first touches keypad.
  - Triggered: Keys make beep sound when pressed
  - Triggered: Detect 150 (link 4, 6, 11) in order with no numbers in between
    - Triggered: Move door smoothly on the X axis, wait six seconds, then move door back smoothly
    - Triggered: Door makes door sound while moving
    - Triggered: Button on HUD turns blue

## Task List

- [x] Detect when player is within 5 meters
- [x] Send player message "Type in key" when first entering 5 meters
- [x] Don't send a player a message again unless it's 30 second later
- [x] Detect when player first touches the keypad, any key
- [x] Keys make beeps sound when pressed
- [x] Reset code when you reach four key presses
- [x] Detect 150 (link 4, 6, 11) in order with no numbers in between.
- [x] Start a 30 second timer when the play first touches the keypad. If the 30 second run out:
  - [x] Send the player a message "The keypad has timed out"
- [x] Communicate with the door that it has been unlocked
  - [x] Remove listen handler when no players are close
- [x] Move door smoothly on the x axis, wait six seconds, then move door back smoothly
- [x] Door makes door sound when first moving
- [x] Button on HUD turns from red to blue

## Potential Features

- Remember attempts by player
- Prevent spamming imputs
- Lock down the keypad after a certain amount of attempts
