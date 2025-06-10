extends CharacterBody2D

var SPEED = 20
const jump_strength = -200.0
var direction = 1

@onready var left_ray_cast: RayCast2D = $LeftRayCast
@onready var right_ray_cast: RayCast2D = $RightRayCast
@onready var shape_cast: ShapeCast2D = $ShapeCast2D
@onready var direction_timer: Timer = $DirectionTimer

func _process(delta: float):
	position.x += direction * SPEED * delta
	if !left_ray_cast.is_colliding(): direction = 1
	if !right_ray_cast.is_colliding(): direction = -1
	if shape_cast.collision_result.any(func(node): return node.collider.name == "Player"):
		var collision_results = shape_cast.collision_result
		var player = collision_results.get(collision_results.find_custom(func(node): return node.collider.name == "Player")).collider
		SPEED = 40
		direction_timer.paused = true
		if player.position.x > self.position.x && is_on_floor(): direction = 1
		if player.position.x < self.position.x && is_on_floor(): direction = -1
	else: 
		SPEED = 20
		direction_timer.paused = false
	
func _physics_process(delta: float):
	if !is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()
