extends State

func inputUpdate(event: InputEvent) -> void:
	var moveUp = event.is_action_pressed('move_up')
	var moveDown = event.is_action_pressed('move_down')
	
	if moveUp and moveDown:
		transition.emit(self, "Idle")
		return
	
	if not moveUp and not moveDown:
		transition.emit(self, "Idle")
		return
	
	if moveUp:
		transition.emit(self, "moveUp")
	elif moveDown:
		return

func processPhysics(delta: float) -> void:
	parent.velocity.y = parent.SPEED * delta
	print ("We are in move_down physicsUpdate")
	parent.move_and_slide()
