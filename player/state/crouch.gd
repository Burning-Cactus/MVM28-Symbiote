extends State

var shape: Shape2D = preload("res://resources/player/collision_box_crouching.tres")

func start():
	parent.play_animation("crouch")
	parent.set_collision_box(shape, Vector2(0, 12))

func physics_update(delta: float):
	if Input.is_action_pressed("jump"):
		state_machine.switch_state("jump")
