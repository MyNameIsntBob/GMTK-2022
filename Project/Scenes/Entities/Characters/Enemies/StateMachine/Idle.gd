extends State

var wait_for := 3
var wait_offset := 0.5

func _ready():
	randomize()

func enter():
	$WaitTimer.wait_time = rand_range(wait_for - wait_offset, wait_for + wait_offset)
	$WaitTimer.start()


func _on_WonderTimer_timeout():
	state_machine.change_state('wondering')

