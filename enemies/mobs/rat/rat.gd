extends CharacterBody2D

var SPEED = 20
const jump_strength = -200.0
var direction = 1

@onready var left_ray_cast: RayCast2D = $LeftRayCast
@onready var right_ray_cast: RayCast2D = $RightRayCast

func _process(delta: float):
	position.x += direction * SPEED * delta
	if !left_ray_cast.is_colliding():
		direction = 1
	
	if !right_ray_cast.is_colliding():
		direction = -1
	
func _physics_process(delta: float):
	if !is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()
