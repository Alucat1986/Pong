class_name Player
extends CharacterBody2D

@export var SPEED = 300.0

var stateMachine

func _ready() -> void:
	stateMachine = $StateMachine
	stateMachine.init(self)

func _input(event: InputEvent) -> void:
	stateMachine.processInput(event)

func _physics_process(delta: float) -> void:
	stateMachine.processPhysics(delta)

func _process(delta: float) -> void:
	stateMachine.process(delta)
