extends Camera

func _process(delta):
	pass
#	$Aim.look_at(get_global_mouse_position())
#	)
#	var position3D = dropPlane.intersects_ray(
#								 $Camera.project_ray_origin($Node2d.get_global_mouse_position()),
#								 $Camera.project_ray_normal($CanvasLayer.get_global_mouse_position()))

func mouse_position():
	var dropPlane  = Plane(Vector3(0, 1, 0), 1)
	var mouse_pos = get_parent().get_node('Node2D').get_global_mouse_position()
	return (dropPlane.intersects_ray(
		project_ray_origin(mouse_pos),
		project_ray_normal(mouse_pos)
	))
