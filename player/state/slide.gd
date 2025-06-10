extends State

var shape: Shape2D = preload("res://resources/player/collision_box_crouching.tres")

var timer = 0

func start():
	parent.play_animation("crouch")
	parent.set_collision_box(shape, Vector2(0, 12))
	timer = 20

# Called every physics frame
func physics_update(delta: float):
	if Input.is_action_pressed("jump"):
		state_machine.switch_state("jump")
		return
	
	var should_stop := false
	if --timer <= 0:
		should_stop = true
	elif abs(parent.velocity.x) < 0.05:
		should_stop = true
	
	if should_stop:
		if Input.is_action_pressed("crouch"):
			state_machine.switch_state("crouch")
		else:
			state_machine.switch_state("idle")

# Clean up in preparation for the next state
func stop():
	pass
