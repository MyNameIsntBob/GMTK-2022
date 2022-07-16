extends KinematicBody
class_name Bullet

var attack_damage = 1
var velocity : Vector3

func _physics_process(delta):
	move_and_slide(velocity)


func _on_Area_body_entered(body):
	if body == self:
		return 
	
	print('hit')
	
	body.damage(attack_damage)
	queue_free()
