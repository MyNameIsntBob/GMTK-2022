extends CanvasLayer

export (NodePath) var dice_path
var dice_node
export (NodePath) var hp_bar_path
var hp_bar_node
export (NodePath) var dash_bar_path
var dash_bar_node

var hp : int setget set_hp
var side : int = 1 setget set_side
var dash_colldown : float setget set_dash_colldown


func _ready():
	dice_node = get_node(dice_path)
	hp_bar_node = get_node(hp_bar_path)
	dash_bar_node = get_node(dash_bar_path)


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
