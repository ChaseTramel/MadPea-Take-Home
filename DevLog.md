# MadPea Take Home

## Requirements

- Player is within 5m

  - Triggered: Send player a message

- Player first touches keypad.
  - Triggered: Keys make beep sound when pressed
  - Triggered: Detect 150 (link 4, 6, 11) in order with no numbers in between
    - Triggered: Move door smoothly on the X axis, wait six seconds, then move door back smoothly
    - Triggered: Door makes door sound while moving
    - Triggered: Button on HUD turns blue

## Tasks

- [x] Detect when player is within 5 meters
- [x] Send player message "Type in key" when first entering 5 meters
- [x] Don't send a player a message again unless it's 30 second later
- [x] Detect when player first touches the keypad, any key
- [ ] Keys make beeps sound when pressed
- [ ] Start a 30 second timer when the play first touches the keypad
- [ ] Detect 150 (link 4, 6, 11) in order with no numbers in between
- [ ] If the 30 second run out:
  - [ ] Send the player a message "The keypad has timed out"
  - [ ] Turn off the listener
- [ ] Move door smoothly on the x axis, wait six seconds, then move door back smoothly
- [ ] Door makes door sound when first moving
- [ ] Button on HUD turns from red to blue
