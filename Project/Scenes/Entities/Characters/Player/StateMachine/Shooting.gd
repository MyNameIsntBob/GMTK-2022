extends State

func enter():
	owner.shoot()
	owner.input_vector = Vector3.ZERO
	state_machine.change_state('idle')
