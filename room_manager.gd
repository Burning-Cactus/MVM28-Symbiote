# Singleton script for switching the current room.
extends Node

var world: Node2D

# Key: String ID
# 
const rooms: Dictionary = {
	0: "start",
	"test1": "test_room_1",
	"test2": "",
}

const test_1 := "test_room_1"
const test_2 := "test_room_2"


# Provide the relative path of the room from the scenes folder.
func switch_room(room_id: String) -> void:
	assert(world != null, "Error: World is null! Are you trying to switch rooms from outside of the main game?")
	world.get_children()[0].queue_free()
	var room := load("res://room/scenes/%s.tscn" % room_id)
	world.add_child(room.instantiate())
