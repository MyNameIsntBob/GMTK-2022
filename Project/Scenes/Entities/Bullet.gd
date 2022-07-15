extends KinematicBody2D
class_name Bullet

var attack_damage = 1
var velocity : Vector2

func _physics_process(delta):
	move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if body == self:
		return 
	
	body.damage(attack_damage)
	queue_free()
