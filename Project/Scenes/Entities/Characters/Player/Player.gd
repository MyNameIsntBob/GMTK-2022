extends Character

func _process(delta):
	health = 300
	var pos = $Camera.mouse_position()
	pos = pos - self.transform.origin
	pos.y = 0
	if pos:
		print(pos)
#		$DiceBoy.transform.origin = $Camera.mouse_position()
		$Aim.look_at(pos.normalized(), Vector3.UP)
#	$DiceBoy.transform
