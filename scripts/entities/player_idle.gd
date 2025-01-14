extends State

func enter() -> void:
	parent.velocity = Vector2.ZERO

func update(_delta: float) -> void:
	var moveUp : bool = Input.is_action_just_pressed("move_up")
	var moveDown : bool = Input.is_action_just_pressed("move_down")
	
	if moveUp and moveDown:
		return
	
	if moveUp:
		transition.emit(self, "moveUp")
	if moveDown:
		transition.emit(self, "moveDown")

func physicsUpdate(_delta: float) -> void:
	pass
