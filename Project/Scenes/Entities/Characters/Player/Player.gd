extends Character

func _ready():
	team = 1
	health = 25

func _process(delta):
	if !is_instance_valid($Camera):
		return
	
	var pos = $Camera.mouse_position()
	if pos:
		$Aim.look_at(pos, Vector3.UP)
	
	if Input.is_action_pressed('shoot'):
		shoot()

func queue_free():
	var camera = $Camera
	remove_child(camera)
	get_parent().add_child(camera)
	.queue_free()
