extends State

func enter():
	owner.shoot()
	
	state_machine.change_state('idle')
