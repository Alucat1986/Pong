extends RigidBody2D

@export var speed: float = 400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomizeStartDirection()


func randomizeStartDirection() -> void:
	var angle = randf_range(-PI / 4, PI / 4) + PI * int(randf() > 0.5)
	var velocity = Vector2(cos(angle), sin(angle)) * speed
	linear_velocity = velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if linear_velocity.length() != speed:
		linear_velocity = linear_velocity.normalized() * speed
