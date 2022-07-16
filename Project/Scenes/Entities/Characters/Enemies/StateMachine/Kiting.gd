extends State

var kite_for := 0.3
var kite_offset := 0.1
var kite_speed := 1

func _ready():
	randomize()

func enter():
	$KitingTimer.wait_time = rand_range(kite_for - kite_offset, kite_for + kite_offset)
	$KitingTimer.start()
	owner.process_input = false
	owner.velocity = random_direction() * kite_speed


func exit():
	owner.process_input = true
	$KitingTimer.stop()


func random_direction():
	return Vector3(rand_range(-1.0, 1.0), 0, rand_range(-1.0, 1.0)).normalized()


func _on_KitingTimer_timeout():
	state_machine.change_state('attacking')
