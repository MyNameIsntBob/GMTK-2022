extends Character

var target

func _ready():
	acceleration = 5
	max_speed = 0.5
	
func _process(delta):
	if target && is_instance_valid(target):
		$Aim.look_at(target.transform.origin, Vector3.UP)
