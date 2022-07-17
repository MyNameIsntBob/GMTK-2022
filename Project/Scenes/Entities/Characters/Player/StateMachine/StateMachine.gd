extends Node

export (NodePath) var start_state

onready var idle = $Idle
onready var moving = $Moving
onready var rolling = $Rolling

onready var dice_boy = get_parent().get_node('Aim/DiceBoy')

var states_map : Dictionary
var current_state : State = null

var has_roll : bool = true

func _ready():
	states_map = {
		'idle': idle,
		'moving': moving,
		'rolling': rolling
	} 
	
	owner = get_parent()
	if not start_state:
		start_state = get_child(0).get_path()
	initialize(start_state)


func initialize(initial_state):
	current_state = get_node(initial_state)
	current_state.enter()


func _process(delta):
	if $RollColldown.time_left:
		Ui.dash_colldown = 5 - $RollColldown.time_left
	else:
		Ui.dash_colldown = 5


func _physics_process(delta):
	if current_state:
		current_state.update(delta)


func change_state(state_name):
	if state_name == 'rolling':
		if has_roll:
			has_roll = false
			$RollColldown.start()
		else:
			return
	
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
	if moving_pressed(event):
		change_state('moving')
	
	if event.is_action_pressed('roll') && owner.input_vector != Vector3.ZERO && current_state in [idle, moving]:
		change_state('rolling')

func moving_pressed(event):
	return event.is_action_pressed('ui_left') || event.is_action_pressed('ui_right') || event.is_action_pressed('ui_up') || event.is_action_pressed('ui_down')


func _on_RollColldown_timeout():
	has_roll = true
