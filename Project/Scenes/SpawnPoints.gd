extends Spatial

onready var CHARACTER = preload("res://Scenes/Entities/Characters/Enemies/Enemy.tscn")

var spawn_points = []

func _ready():
	for child in get_children():
		if child is Position3D:
			spawn_points.append(child)


func _on_SpawnTimer_timeout():
	var character = CHARACTER.instance()
	
	var pos = spawn_points[(randi()%len(spawn_points))]
	
	get_parent().add_child(character)
	
	character.transform.origin = pos.transform.origin
