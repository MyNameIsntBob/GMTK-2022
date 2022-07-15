extends KinematicBody2D
class_name Character

var health = 3

var input_vector : Vector2
var velocity : Vector2 
var shoot_speed = 10

onready var shoot_pos = $Aim/Position2D
onready var BULLET = preload("res://Scenes/Entities/Bullet.tscn")

func _physics_process(delta):
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
