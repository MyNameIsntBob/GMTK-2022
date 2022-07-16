extends Camera

func mouse_position():
	var dropPlane  = Plane(Vector3(0, 1, 0), 1)
	var mouse_pos = $Node2D.get_global_mouse_position()
	var pos = dropPlane.intersects_ray(
		project_ray_origin(mouse_pos),
		project_ray_normal(mouse_pos)
	)
	pos.y = 0
	pos.z -= 0.3
	return pos
