extends CanvasLayer


const game = 'res://Scenes/World.tscn'
const controls = 'res://Scenes/Controls.tscn'
const credits = 'res://Scenes/Credits.tscn'


func _ready():
	for node in Ui.get_children():
		if node is Control:
			node.hide()


func _on_Play_pressed():
	for node in Ui.get_children():
		if node is Control:
			node.show()
	get_tree().change_scene(game)



func _on_Controls_pressed():
	get_tree().change_scene(controls)


func _on_Credits_pressed():
	get_tree().change_scene(credits)


func _on_Exit_pressed():
	get_tree().quit()

