extends KinematicBody2D
class_name Bullet

var velocity : Vector2

func _physics_process(delta):
	move_and_slide(velocity)
