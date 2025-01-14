extends State

func enter() -> void:
	parent.velocity.y = 1

func exit() -> void:
	parent.velocity.y = 0

func update(_delta: float) -> void:
	var moveUp : bool = Input.is_action_pressed("move_up")
	var moveDown : bool = Input.is_action_pressed("move_down")
	
	if (moveUp and moveDown) or (not moveUp and not moveDown):
		transition.emit(self, "Idle")
		return
	
	if moveUp:
		transition.emit(self, "moveUp")
	elif moveDown:
		return

func physicsUpdate(delta: float) -> void:
	var collision = parent.move_and_collide(parent.velocity * parent.SPEED * delta)
	if collision:
		parent.velocity.y = 0
