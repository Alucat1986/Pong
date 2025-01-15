extends RigidBody2D

@export var SPEED: float = 400.0

func _ready() -> void:
	randomizeStartDirection()

func randomizeStartDirection() -> void:
	var angle = randf_range(-PI / 4, PI / 4) + PI * int(randf() > 0.5)
	var velocity = Vector2(cos(angle), sin(angle)) * SPEED
	apply_central_impulse(velocity)

func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	if linear_velocity.length() != SPEED:
		linear_velocity = linear_velocity.normalized() * SPEED
	if linear_velocity.normalized().y > 0.95:
		if linear_velocity.x <= 0:
			apply_central_impulse(Vector2(-20, 0))
		else:
			apply_central_impulse(Vector2(20, 0))

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Paddles") or body.is_in_group("Obstacles"):
		$Collide.play()
