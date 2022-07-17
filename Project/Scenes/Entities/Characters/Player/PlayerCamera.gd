extends Camera

onready var initial_position := transform.origin as Vector3
onready var initial_rotation := rotation_degrees as Vector3

export var reset_speed := 0.1

export var kickback_speed := 0.2
var kicking_back : bool = false
var kickback_to : Vector3

func mouse_position():
	var dropPlane  = Plane(Vector3(0, 1, 0), 1)
	var mouse_pos = $Node2D.get_global_mouse_position()
	var pos = dropPlane.intersects_ray(
		project_ray_origin(mouse_pos),
		project_ray_normal(mouse_pos)
	)
	pos.y = 0
	pos.z -= 0.4
	return pos


func kickback(force, direction):
	kicking_back = true
	kickback_to = initial_position + (direction.normalized() * force)


func _process(delta):
	if kicking_back:
		if kickback_to.distance_to(transform.origin) < 0.1:
			kicking_back = false
		transform.origin = transform.origin.linear_interpolate(kickback_to, kickback_speed)
	else:
		transform.origin = transform.origin.linear_interpolate(initial_position, reset_speed)
#
#	if transform.origin != initial_position:
#		transform.origin = transform.origin.linear_interpolate(initial_position, reset_speed)
