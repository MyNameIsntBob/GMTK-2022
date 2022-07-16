extends Node2D

export (NodePath) var start_state

onready var idle = $Idle
onready var moving = $Moving
onready var shooting = $Shooting

var states_map : Dictionary
var current_state : State = null

func _ready():
	states_map = {
		'idle': idle,
		'moving': moving,
		'shooting': shooting
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
	get_parent().get_node('State').text = state_name
	if current_state:
		current_state.exit()
	
	current_state = states_map[state_name]
	current_state.enter()


func _on_animation_finished():
	current_state._on_animation_finished()


func _unhandled_input(event):
	if current_state.cancelable:
		_check_for_state_change(event)
	
	current_state.handle_input(event)


func _check_for_state_change(event):
	if moving_pressed(event):
		change_state('moving')
	
	if event.is_action_pressed('shoot'):
		change_state('shooting')
		
#	if event.is_action_.is_action_just_pressed('shoot'):
#		print('shoot')
#		shoot()
	
#	if event.is_action_pressed('roll') && current_state in [idle, moving]:
#		change_state('roll')

func moving_pressed(event):
	return event.is_action_pressed('ui_left') || event.is_action_pressed('ui_right') || event.is_action_pressed('ui_up') || event.is_action_pressed('ui_down')
