extends State

var wait_for := 1.5
var wait_offset := 0.5

func _ready():
	randomize()

func enter():
	$WaitTimer.wait_time = rand_range(wait_for - wait_offset, wait_for + wait_offset)
	$WaitTimer.start()
	if is_instance_valid(owner):
		owner.input_vector = Vector3.ZERO


func exit():
	$WaitTimer.stop()


func _on_WaitTimer_timeout():
	state_machine.change_state('wandering')
