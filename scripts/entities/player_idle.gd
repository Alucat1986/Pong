extends State

func enter() -> void:
	parent.velocity = Vector2.ZERO

func inputUpdate(event: InputEvent) -> void:
	var moveUp = Input.is_action_pressed('move_up')
	var moveDown = event.is_action_pressed('move_down')
	
	if moveUp and moveDown:
		return
	
	if moveUp:
		transition.emit(self, "moveUp")
	if moveDown:
		transition.emit(self, "moveDown")

func physicsUpdate(_delta: float) -> void:
	print ("We are in Idle physicsUpdate")
