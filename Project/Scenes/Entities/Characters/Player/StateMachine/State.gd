extends Node
class_name State
# Base interface for all states: it doesn't do anything by itself,
# but forces us to pass the right arguments to the methods below
# and makes sure every State object had all of these methods.

export var cancelable : bool = true
onready var sprite : AnimatedSprite
onready var state_machine : Node = get_parent()

# warning-ignore:unused_signal
signal finished(next_state_name)

func _ready():
	pass
#	owner = state_machine.owner
#	if owner:
#		sprite = owner.get_node('Sprite')

# Initialize the state. E.g. change the animation.
func enter():
	pass


# Clean up the state. Reinitialize values like a timer.
func exit():
	pass
#	sprite.stop()


func handle_input(_event):
	pass


func update(_delta):
	pass


func _on_animation_finished(animation_name):
	pass
