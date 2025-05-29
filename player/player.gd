extends CharacterBody2D

const speed = 150.0
const jump_strength = -400.0

const max_health = 100.0
var health = max_health



func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity += get_gravity() * delta
	elif Input.is_action_just_pressed("jump"):
		velocity.y = jump_strength
	
	var direction := Input.get_axis("move_left", "move_right")
	
	var is_running = Input.is_action_pressed("run")
	
	var current_speed = speed
	if is_running:
		current_speed *= 2
	
	velocity.x = direction * current_speed
	
	move_and_slide()


func hurt(damage: float) -> void:
	health -= damage
	print(health)
	if health <= 0.0:
		die()

func die() -> void: # Commence game over sequence
	get_tree().change_scene_to_file("res://game_over.tscn")
