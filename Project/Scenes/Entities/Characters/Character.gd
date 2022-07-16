extends KinematicBody2D
class_name Character

export var health = 3
export var shoot_speed = 10

export var acceleration = 20000
export var max_speed = 1000

export var friction = 0.2

var input_vector : Vector2 = Vector2.ZERO
var velocity : Vector2 

onready var shoot_pos = $Aim/Position2D
onready var BULLET = preload("res://Scenes/Entities/Bullet.tscn")

func _physics_process(delta):
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector.normalized() * acceleration * delta
		velocity = velocity.clamped(max_speed)
	else:
		velocity = velocity.linear_interpolate(Vector2(0, 0), friction)
	
	velocity = move_and_slide(velocity)


func _process(delta):
	$Health.text = str(health)


func shoot():
	var bullet : Bullet = BULLET.instance()
	get_parent().add_child(bullet)
	bullet.global_position = shoot_pos.global_position
	bullet.velocity = (shoot_pos.global_position - self.global_position) * shoot_speed


func damage(amount):
	health -= amount
	
	if health <= 0:
		queue_free()
