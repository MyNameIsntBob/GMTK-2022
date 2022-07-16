extends Character

func _process(delta):
	health = 300
	var pos = $Camera.mouse_position()
	if pos:
		$Aim.look_at(pos, Vector3.UP)
	
	if Input.is_action_just_pressed('shoot'):
		shoot()
