extends VBoxContainer

const menu = 'res://Scenes/MainMenu.tscn'


func _on_Button_pressed():
	get_tree().change_scene(menu)
