extends CanvasLayer

export (NodePath) var dice_path
var dice_node
export (NodePath) var hp_bar_path
var hp_bar_node
export (NodePath) var dash_bar_path
var dash_bar_node
export (NodePath) var dash_highlight_path
var dash_highlight_node
export (NodePath) var reload_bar_path
var reload_bar_node
export (NodePath) var score_label_path
var score_label_node

var score : int = 0 setget set_score
var hp : int setget set_hp
var side : int = 1 setget set_side
var dash_colldown : float setget set_dash_colldown

var reload_time : float setget set_reload_time
var max_reload_time : float setget set_max_reload_time

func _ready():
	dice_node = get_node(dice_path)
	hp_bar_node = get_node(hp_bar_path)
	dash_bar_node = get_node(dash_bar_path)
	reload_bar_node = get_node(reload_bar_path)
	dash_highlight_node = get_node(dash_highlight_path)
	score_label_node = get_node(score_label_path)
	set_score(0)


func set_side(new_side):
	dice_node.get_node('Dice' + str(side)).hide()
	dice_node.get_node('Dice' + str(new_side)).show()
	
	side = new_side


func set_hp(new_hp):
	hp_bar_node.value = new_hp
	hp = new_hp


func set_dash_colldown(new_time):
	dash_bar_node.value = new_time
	dash_colldown = new_time
	
	if new_time >= 5:
		dash_highlight_node.show()
	else:
		dash_highlight_node.hide()


func set_reload_time(new_reload_time):
	reload_bar_node.value = new_reload_time
	reload_time = new_reload_time


func set_max_reload_time(new_max_reload_time):
	reload_bar_node.max_value = new_max_reload_time
	max_reload_time = new_max_reload_time


func set_score(new_score):
	score_label_node.text = 'Score:\n' + str(new_score)
	score = new_score


func _input(event):
	if event.is_action_pressed('ui_cancel'):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
