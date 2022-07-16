extends State

var shoot_time := 1.5
var shoot_offset := 0.5

func enter():
	owner.shoot()
	$ShootTimer.start()


func exit():
	$ShootTimer.stop()


func _on_ShootTimer_timeout():
	owner.shoot()
	if randi()%3 == 0:
		state_machine.change_state('kiting')
		return
	$ShootTimer.wait_time = rand_range(shoot_time - shoot_offset, shoot_time + shoot_offset)
