extends KinematicBody
class_name Character

export var health = 5 setget set_health

export var acceleration = 10
export var max_speed = 0.8
export var friction = 0.2

var team = 0
var input_vector : Vector3 = Vector3.ZERO
var process_input : bool = true
var velocity : Vector3

var can_shoot : bool = true
var bullet_speed = 10
var shoot_distance : float = 5.0
var shoot_damage : float = 1
var gun_name
var shoot_counter := 0

onready var shoot_pos : Array = []
onready var BULLET = preload("res://Scenes/Entities/Bullet.tscn")

func _ready():
	for child in $Aim.get_children():
		if child is Position3D:
			shoot_pos.append(child)


func _physics_process(delta):
	transform.origin.y = 0
	
	if process_input:
		if input_vector != Vector3.ZERO:
			velocity += input_vector.normalized() * acceleration * delta
			var vel_2d = Vector2(velocity.x, velocity.z)
			vel_2d = vel_2d.clamped(max_speed)
			velocity.x = vel_2d.x
			velocity.z = vel_2d.y
		else:
			velocity = velocity.linear_interpolate(Vector3(0, 0, 0), friction)
	velocity = move_and_slide(velocity)


func set_health(new_health):
	health = new_health


func shoot():
	if !can_shoot:
		return
	
	$ShootDelay.start()
	
	if gun_name == 'DoubleShot':
		shoot_counter = (shoot_counter + 1) % 2
		shoot_gun(shoot_pos[shoot_counter])
	
	else:
		for pos in shoot_pos:
			shoot_gun(pos)
	
	can_shoot = false


func shoot_gun(pos):
	var bullet : Bullet = BULLET.instance()
	bullet.shoot_distance = shoot_distance
	get_parent().add_child(bullet)
	bullet.shot_by = self
	bullet.attack_damage = shoot_damage
	bullet.transform.origin = pos.transform.origin
	bullet.global_transform.origin = pos.global_transform.origin
	# Game breaks without this line, can't seam to find out how to get it to work without
	if !bullet_speed:
		bullet_speed = 10
	bullet.velocity = (pos.global_transform.origin - self.global_transform.origin) * bullet_speed
	bullet.transform.basis = $Aim.transform.basis


func damage(amount, direction):
	self.health -= amount
	
	velocity += direction
	
	if health <= 0:
		Ui.score += 1
		queue_free()


func _on_ShootDelay_timeout():
	can_shoot = true
