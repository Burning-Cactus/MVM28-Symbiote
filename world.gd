extends Node2D

func _ready() -> void:
	RoomManager.world = self

func _process(delta: float) -> void:
	pass
	# if Input.is_action_just_pressed("ui_accept"):
	# 	RoomManager.switch_room(RoomManager.test_2)
