extends State

var wander_for := 2.0
var wander_offset := 0.5

func _ready():
	randomize()

func enter():
	$WanderTimer.wait_time = rand_range(wander_for - wander_offset, wander_for + wander_offset)
	$WanderTimer.start()
	owner.input_vector = random_direction()


func exit():
	$WanderTimer.stop()


func random_direction():
	return Vector3(rand_range(-1.0, 1.0), 0, rand_range(-1.0, 1.0))


func _on_WonderTimer_timeout():
	state_machine.change_state('idle')
