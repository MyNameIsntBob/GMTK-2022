extends Character

var acceleration = 20000
var max_speed = 1000

var friction = 0.2

func _physics_process(delta):
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength('ui_left')
	input_vector.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector.normalized() * acceleration * delta
		velocity = velocity.clamped(max_speed)
	else:
		velocity = velocity.linear_interpolate(Vector2(0, 0), friction)
	
	$Aim.look_at(get_global_mouse_position())

func _process(delta):
	if Input.is_action_just_pressed('shoot'):
		print('shoot')
		shoot()
