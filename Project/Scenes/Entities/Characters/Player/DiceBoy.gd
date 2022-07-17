extends Spatial

var animation : String = 'Walk' setget set_animation

func set_animation(new_animation):
	print('set_animation')
	var old_boy = get_node(animation)
	var new_boy = get_node(new_animation)
	print(old_boy)
	print(new_boy)
	
	old_boy.visible = false
	new_boy.visible = true
	
#	old_boy.get_node("AnimationPlayer").stop()
#	new_boy.get_node('AnimationPlayer').play('default')
	animation = new_animation
