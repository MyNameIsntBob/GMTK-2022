extends Character

func _process(delta):
	$Aim.look_at(get_global_mouse_position())
