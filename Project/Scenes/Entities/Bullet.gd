extends KinematicBody
class_name Bullet

var attack_damage = 1
var velocity : Vector3
var shot_by

func _physics_process(delta):
	move_and_slide(velocity)


func _on_Area_body_entered(body):
	if body == self || body.team == shot_by.team:
		return 
	
	body.damage(attack_damage)
	queue_free()
