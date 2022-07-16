extends Character

func _process(delta):
	health = 300
	var pos = $Camera.mouse_position()
	if pos:
#		print(pos)
#		$DiceBoy.transform.origin = $Camera.mouse_position()
		$Aim.look_at(pos, Vector3.UP)
#	$DiceBoy.transform
	
	if Input.is_action_just_pressed('shoot'):
		shoot()
