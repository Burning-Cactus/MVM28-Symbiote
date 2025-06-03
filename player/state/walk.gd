extends State

# Initialize the entity's new state
func start():
	pass

# Called every frame
func update(delta):
	pass

# Called every physics frame
func physics_update(delta):
	if Input.is_action_pressed("jump"):
		state_machine.switch_state("jump")
	elif Input.is_action_pressed("slide"):
		state_machine.switch_state("slide")
	elif Input.is_action_pressed("crouch"):
		state_machine.switch_state("crouch")
	elif Input.get_axis("move_left", "move_right") < 0.05 && parent.velocity.x < 0.05:
		state_machine.switch_state("idle")

# Clean up in preparation for the next state
func stop():
	pass
