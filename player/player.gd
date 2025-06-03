extends CharacterBody2D

const speed = 150.0
const jump_strength = -400.0

const max_health = 100.0
var health = max_health

@onready var default_shape: Shape2D = $CollisionBox.shape
@onready var state_machine: StateMachine = $StateMachine

var bullet_scene = preload("res://player/bullet.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet)
	
	bullet.position = Vector2(position.x + 10, position.y)
	bullet.rotation = 0

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity += get_gravity() * delta
	
	var direction := Input.get_axis("move_left", "move_right")
	
	var is_running = Input.is_action_pressed("run")
	
	var current_speed = speed
	if is_running:
		current_speed *= 2
	
	velocity.x = direction * current_speed
	
	move_and_slide()


func _on_hurt(damage: float) -> void:
	health -= damage
	if health <= 0.0:
		die()

func die() -> void: # Commence game over sequence
	get_tree().change_scene_to_file("res://game_over.tscn")

func play_animation(animation: String) -> void:
	$AnimatedSprite2D.play(animation)

func set_collision_box(shape: Shape2D, offset: Vector2 = Vector2.ZERO) -> void:
	$CollisionBox.shape = shape
	$CollisionBox.position = offset
	$Hurtbox/Default.shape = shape
	$Hurtbox/Default.position = offset

func set_default_collision_box() -> void:
	set_collision_box(default_shape)
