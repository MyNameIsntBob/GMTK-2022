extends KinematicBody
class_name Bullet

var attack_damage = 1
var velocity : Vector3
var shot_by
var shoot_distance : float = 5.0 setget set_shoot_distance

func set_shoot_distance(new_distance):
	shoot_distance = new_distance
	$KillTimer.wait_time = new_distance
	print(new_distance)


func _physics_process(delta):
	move_and_slide(velocity)


func _on_Area_body_entered(body):
	if !is_instance_valid(shot_by) || !body is KinematicBody:
		queue_free()
		return
	
	if body == self || body.team == shot_by.team:
		return 
	
	body.damage(attack_damage)
	queue_free()


func _on_KillTimer_timeout():
	queue_free()
