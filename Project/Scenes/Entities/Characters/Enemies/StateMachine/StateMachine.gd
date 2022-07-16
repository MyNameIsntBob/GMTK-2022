extends Node

export (NodePath) var start_state

onready var idle = $Idle
onready var wandering = $Wandering

var states_map : Dictionary
var current_state : State = null

func _ready():
	states_map = {
		'idle': idle,
		'wandering': wandering
	} 
	
	owner = get_parent()
	if not start_state:
		start_state = get_child(0).get_path()
	initialize(start_state)


func initialize(initial_state):
	current_state = get_node(initial_state)
	current_state.enter()


func _physics_process(delta):
	if current_state:
		current_state.update(delta)


func change_state(state_name):
	if current_state:
		current_state.exit()
	
	current_state = states_map[state_name]
	current_state.enter()


func _on_animation_finished(animation_name):
	current_state._on_animation_finished(animation_name)


func _unhandled_input(event):
	if current_state.cancelable:
		_check_for_state_change(event)
	
	current_state.handle_input(event)


func _check_for_state_change(event):
	pass
