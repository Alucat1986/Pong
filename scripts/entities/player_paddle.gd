class_name Player
extends CharacterBody2D

@export var SPEED : float = 400.0

var stateMachine

func _ready() -> void:
	stateMachine = $StateMachine
	stateMachine.init(self)

func _physics_process(delta: float) -> void:
	stateMachine.processPhysics(delta)

func _process(delta: float) -> void:
	position.x = 30
	stateMachine.process(delta)
