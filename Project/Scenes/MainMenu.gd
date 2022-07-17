extends CanvasLayer


const game = 'res://Scenes/World.tscn'


func _ready():
	for node in Ui.get_children():
		node.hide()


func _on_Play_pressed():
	for node in Ui.get_children():
		node.show()
	get_tree().change_scene(game)



func _on_Controls_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	pass # Replace with function body.
