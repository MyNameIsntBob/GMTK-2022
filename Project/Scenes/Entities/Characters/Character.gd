extends KinematicBody
class_name Character

export var health = 3
export var shoot_speed = 10

export var acceleration = 10
export var max_speed = 0.8

export var friction = 0.2

var can_shoot : bool = true
var team = 0
var input_vector : Vector3 = Vector3.ZERO
var process_input : bool = true
var velocity : Vector3

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
	#		if input_vector.x == 0: 
	#			velocity.x *= friction
	#		if input_vector.z == 0:
	#			velocity.z *= friction
			velocity = velocity.linear_interpolate(Vector3(0, 0, 0), friction)
	velocity = move_and_slide(velocity)


func shoot():
	if !can_shoot:
		return
	
	$ShootDelay.start()
	
	for pos in shoot_pos:
		var bullet : Bullet = BULLET.instance()
		get_parent().add_child(bullet)
		bullet.shot_by = self
		bullet.transform.origin = pos.transform.origin
		bullet.global_transform.origin = pos.global_transform.origin
		bullet.velocity = (pos.global_transform.origin - self.global_transform.origin) * shoot_speed
	can_shoot = false


func damage(amount):
	health -= amount
	
	if health <= 0:
		queue_free()


func _on_ShootDelay_timeout():
	can_shoot = true
