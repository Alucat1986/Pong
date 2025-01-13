class_name State
extends Node

var parent: Player

signal transition(state: State, newStateName: String)

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physicsUpdate(_delta: float) -> void:
	pass

func inputUpdate(_event: InputEvent) -> void:
	pass
