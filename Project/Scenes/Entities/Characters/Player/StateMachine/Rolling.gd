extends State

var roll_speed := 3
var owner_collision_layer

func _ready():
	cancelable = false
	owner_collision_layer = owner.collision_layer


func enter():
	state_machine.dice_boy.animation = 'Roll'
	owner.side = randi()%6+1
	owner.collision_layer = 0
	owner.velocity = owner.velocity.normalized() * roll_speed
	$RollTime.start()
	owner.process_input = false


func exit():
	owner.collision_layer = owner_collision_layer
	owner.process_input = true


func _on_RollTime_timeout():
	state_machine.change_state('moving')
