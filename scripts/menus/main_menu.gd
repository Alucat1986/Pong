extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	pass # Replace with function body.


func _on_end_button_pressed() -> void:
	get_tree().quit()


func _on_end_button_mouse_entered() -> void:
	$CanvasLayer/EndButton.grab_focus()


func _on_start_button_mouse_entered() -> void:
	$CanvasLayer/StartButton.grab_focus()
