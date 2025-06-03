# Extended camera node to avoid loading a whole scene when a camera is needed.
class_name PlayerCamera
extends Camera2D

@export var player: Node2D
var target: Node2D

func _ready() -> void:
	assert(player != null, "Error: player must not be null!")
	target = player

# Follow the target.
func _process(delta: float) -> void:
	position = target.global_position
