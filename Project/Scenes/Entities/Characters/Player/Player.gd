extends Character

func _ready():
	team = 1
	health = 20

func _process(delta):
	var pos = $Camera.mouse_position()
	if pos:
		$Aim.look_at(pos, Vector3.UP)
	
	if Input.is_action_just_pressed('shoot'):
		shoot()
