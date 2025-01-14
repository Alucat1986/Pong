extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_left_wall_body_exited(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		GameManager.aiScoresPoint()


func _on_right_wall_body_exited(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		GameManager.playerScoresPoint()
