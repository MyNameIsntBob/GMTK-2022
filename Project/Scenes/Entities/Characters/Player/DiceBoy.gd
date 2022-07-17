extends Spatial

var animation : String = 'Walk' setget set_animation
var current_boy

func set_animation(new_animation):
	var old_boy = get_node(animation)
	var new_boy = get_node(new_animation)
	
	old_boy.visible = false
	new_boy.visible = true
	
	current_boy = new_boy
	
	old_boy.get_node("AnimationPlayer").stop()
	new_boy.get_node('AnimationPlayer').play('default')
	animation = new_animation


func _on_AnimationPlayer_animation_finished(anim_name):
	current_boy.play('anim_name')
