extends Node

var playerScore : int = 0
var aiScore : int = 0
var gameOver : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GUI/PlayerScore.text = str(playerScore)
	$GUI/AiScore.text = str(aiScore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if gameOver:
		gameOver = false
		get_tree().reload_current_scene()

func startGame() -> void:
	get_tree().change_scene_to_file(("res://scenes/level/level.tscn"))
	$GUI.visible = true

func aiScoresPoint() -> void:
	aiScore += 1
	resetGame()

func playerScoresPoint() -> void:
	playerScore += 1
	resetGame()

func resetGame() -> void:
	$GUI/PlayerScore.text = str(playerScore)
	$GUI/AiScore.text = str(aiScore)
	$Goal.play()
	gameOver = true
