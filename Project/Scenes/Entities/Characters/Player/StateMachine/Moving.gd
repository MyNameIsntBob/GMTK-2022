extends State

func update(delta):
	owner.input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength('ui_left')
	owner.input_vector.z = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	
	if owner.input_vector == Vector3.ZERO:
		state_machine.change_state('idle')
