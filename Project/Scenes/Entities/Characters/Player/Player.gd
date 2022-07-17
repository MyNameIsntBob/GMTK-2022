extends Character

var side : int setget set_side

var guns = {
	1: 'Sniper',
	2: 'DoubleShot',
	3: 'Shotgun',
	4: 'CornerShot',
	5: 'WideShot',
	6: 'MachineGun'
}

func _ready():
	team = 1
	self.health = 25
	self.side = 1

func _process(delta):
	if !is_instance_valid($Camera):
		return
	
	var pos = $Camera.mouse_position()
	if pos:
		$Aim.look_at(pos, Vector3.UP)
	
	if Input.is_action_pressed('shoot'):
		shoot()
	
	if can_shoot:
		Ui.reload_time = $ShootDelay.wait_time
	else:
		Ui.reload_time = $ShootDelay.wait_time - $ShootDelay.time_left


func set_side(new_side):
	Ui.set_side(new_side)
	shoot_pos = []
	gun_name = guns[new_side]
	var gun = $Aim.get_node(gun_name)
	for child in gun.get_children():
		if child is Position3D:
			shoot_pos.append(child)
	
	bullet_speed = gun.bullet_speed
	shoot_distance = gun.shoot_distance
	shoot_damage = gun.shoot_damage
	$ShootDelay.wait_time = gun.shoot_speed
	Ui.max_reload_time = gun.shoot_speed
	
	side = new_side


func set_health(new_health):
	Ui.hp = new_health
	
	.set_health(new_health)


func queue_free():
	var camera = $Camera
	remove_child(camera)
	get_parent().add_child(camera)
	.queue_free()
