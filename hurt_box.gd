class_name HurtBox
extends Area2D

var parent: Node2D

func _ready():
	assert(get_parent().has_method("hurt"))
	parent = get_parent()
	
func take_damage(damage: float):
	parent.hurt(damage)
