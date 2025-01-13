extends Node

@export var initialState : State

var currentState : State
var states : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func init(parent: Player) -> void:
	for child in get_children():
		if child is State:
			child.parent = parent
			states[child.name.to_lower()] = child
			child.transition.connect(onChildTransition)
	
	if initialState:
		initialState.enter()
		currentState = initialState

func process(delta: float) -> void:
	if currentState:
		currentState.update(delta)

func processPhysics(delta: float) -> void:
	if currentState:
		currentState.physicsUpdate(delta)

func processInput(event: InputEvent) -> void:
	if currentState:
		currentState.inputUpdate(event)

func onChildTransition(stateName : State, newStateName : String) -> void:
	if stateName != currentState:
		return
	
	var newState = states.get(newStateName.to_lower())
	if !newState:
		return
	
	if currentState:
		currentState.exit()
	
	newState.enter()
	currentState = newState
