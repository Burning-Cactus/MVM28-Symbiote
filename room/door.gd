extends Node2D

@export var target_room: String
@export var target_door: String

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	RoomManager.switch_room(target_room, target_door)
