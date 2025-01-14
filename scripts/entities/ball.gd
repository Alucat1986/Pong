extends RigidBody2D

@export var SPEED: float = 400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomizeStartDirection()

func randomizeStartDirection() -> void:
	var angle = randf_range(-PI / 4, PI / 4) + PI * int(randf() > 0.5)
	var velocity = Vector2(cos(angle), sin(angle)) * SPEED
	linear_velocity = velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if linear_velocity.length() != SPEED:
		linear_velocity = linear_velocity.normalized() * SPEED
	if linear_velocity.normalized().y > 0.95:
		apply_central_impulse(Vector2(-50, 0))


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Paddles") or body.is_in_group("Obstacles"):
		$Collide.play()
