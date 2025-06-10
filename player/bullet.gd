extends Node2D

var speed: float = 10.0
var direction: Vector2

func _ready() -> void:
	$HitBox.strength = 4
	direction = Vector2(cos(rotation), sin(rotation))

func _process(delta: float) -> void:
	position += direction * speed
