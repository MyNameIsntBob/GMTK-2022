extends KinematicBody2D
class_name Character

var input_vector : Vector2
var velocity : Vector2 

func _physics_process(delta):
	velocity = move_and_slide(velocity)


func shoot():
	pass
