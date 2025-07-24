# MiniMicro-InputSystem
An Input System for MiniMicro

## How to use
Import the `Input.ms` file and execute the function `updateInput` on your main loop, then use any of the following funcionts.

## Keyboard Functions
All functions take a string with any of the default key names of MiniMicro, and return true/false depending on the function. This functions also work with `joystick button ..`

`keyPressed`
Returns true the first frame you press the key

`keyReleased`
Returns true the first frame you release the key

`keyDown`
Return true when the key has been pressed for more than 1 frames

`keyUp`
Return true when the key has been released for more than 1 frames

## Example
```
clear
import "Input"

while true
  updateInput

  if keyPressed("space") then
    print "Spacebar has been pressed"
  end if

  yield
end while
```
