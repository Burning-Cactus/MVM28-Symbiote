extends State

# Initialize the entity's new state
func start():
	parent.play_animation("slide")

# Called every frame
func update(delta: float):
	if abs(parent.velocity.x) < 0.05:
		state_machine.switch_state("idle")

# Called every physics frame
func physics_update(delta: float):
	pass

# Clean up in preparation for the next state
func stop():
	pass
