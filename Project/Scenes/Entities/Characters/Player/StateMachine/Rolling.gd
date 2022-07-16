extends State

var roll_speed := 2

func ready():
	cancelable = false

func enter():
	owner.velocity = owner.velocity.normalized() * roll_speed
	$RollTime.start()
	print('rolling')
	owner.process_input = false
	
func exit():
	owner.process_input = true



func _on_RollTime_timeout():
	state_machine.change_state('moving')
