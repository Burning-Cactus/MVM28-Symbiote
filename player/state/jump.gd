extends State

# Initialize the entity's new state
func start():
	parent.velocity.y = parent.jump_strength

# Called every physics frame
func physics_update(delta):
	if parent.is_on_floor():
		state_machine.switch_state("idle")
