# meta-name: State Machine Node
# meta-description: Default template for creating an entity state
# meta-default: true

extends State

# Initialize the entity's new state
func start() -> void:
	pass

# Called every frame
func update(delta: float) -> void:
	pass

# Called every physics frame
func physics_update(delta: float) -> void:
	pass

# Clean up in preparation for the next state
func stop() -> void:
	pass
