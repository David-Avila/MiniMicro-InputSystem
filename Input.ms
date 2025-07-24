
_KeyBoardKeys = {}
_MouseButtons = [{"prev": "up", "state": "up"}] * 3

for kn in key.keyNames
	_KeyBoardKeys[kn] = {"prev": "up", "state": "up"}
end for

globals.updateInput = function
	for k in _KeyBoardKeys
		k.value.prev = k.value.state
		
		if key.pressed(k.key) then
			if k.value.state == "released" or k.value.state == "up" then
				k.value.state = "pressed"
			else if k.value.state == "pressed" then
				k.value.state = "down"
			end if
		else
			if k.value.state == "down" or k.value.state == "pressed" then
				k.value.state = "released"
			else if k.value.state == "released" then
				k.value.state = "up"
			end if
		end if
	end for
	
	for i in range(0, _MouseButtons.len-1)
		_MouseButtons[i].prev = _MouseButtons[i].state
		
		if mouse.button(i) then
			if _MouseButtons[i].state == "released" or _MouseButtons[i].state == "up" then
				_MouseButtons[i].state = "pressed"
			else if _MouseButtons[i].state == "pressed" then
				_MouseButtons[i].state = "down"
			end if
		else
			if _MouseButtons[i].state == "pressed" or _MouseButtons[i].state == "down" then
				_MouseButtons[i].state = "released"
			else if _MouseButtons[i].state == "released" then
				_MouseButtons[i].state = "up"
			end if			
		end if
	end for
	
end function

globals.keyPressed = function(k)
	return _KeyBoardKeys[k].state == "pressed"
end function

globals.keyDown = function(k)
	return _KeyBoardKeys[k].state == "down"
end function

globals.keyReleased = function(k)
	return _KeyBoardKeys[k].state == "released"
end function

globals.keyUp = function(k)
	return _KeyBoardKeys[k].state == "up"
end function

globals.mousePressed = function(b)
	return _MouseButtons[b].state == "pressed"
end function

globals.mouseDown = function(b)
	return _MouseButtons[b].state == "down"
end function

globals.mouseReleased = function(b)
	return _MouseButtons[b].state == "released"
end function

globals.mouseUp = function(b)
	return _MouseButtons[b].state == "up"
end function
