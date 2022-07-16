extends Character

var side : int setget set_side

var side_stats = {
	1: {'shoot_speed': 2, 'shoot_damage': 10, 'special': 'Sniper', 'shoot_distance': 5, 'bullet_speed': 15},
	2: {'shoot_speed': 0.5, 'shoot_damage': 2, 'special': 'DoubleShot', 'shoot_distance': 5, 'bullet_speed': 10},
	3: {'shoot_speed': 2, 'shoot_damage': 5, 'special': 'Shotgun', 'shoot_distance': 0.3, 'bullet_speed': 25},
	4: {'shoot_speed': 1, 'shoot_damage': 1, 'special': 'CornerShot', 'shoot_distance': 5, 'bullet_speed': 10},
	5: {'shoot_speed': 2, 'shoot_damage': 1, 'special': '', 'shoot_distance': 5, 'bullet_speed': 10},
	6: {'shoot_speed': 0.1, 'shoot_damage': 1, 'special': 'MachineGun', 'shoot_distance': 5, 'bullet_speed': 10}
}

func _ready():
	team = 1
	health = 25
	self.side = 3

func _process(delta):
	if !is_instance_valid($Camera):
		return
	
	var pos = $Camera.mouse_position()
	if pos:
		$Aim.look_at(pos, Vector3.UP)
	
	if Input.is_action_pressed('shoot'):
		shoot()


func set_side(new_side):
	shoot_pos = []
	var stats = side_stats[new_side]
	for child in $Aim.get_node(stats['special']).get_children():
		if child is Position3D:
			shoot_pos.append(child)
	
	bullet_speed = stats['bullet_speed']
	special_gun = stats['special']
	shoot_distance = stats['shoot_distance']
	shoot_damage = stats['shoot_damage']
	$ShootDelay.wait_time = stats['shoot_speed']
	
	side = new_side


func queue_free():
	var camera = $Camera
	remove_child(camera)
	get_parent().add_child(camera)
	.queue_free()



