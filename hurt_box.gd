class_name HurtBox
extends Area2D

var parent: Node

func _ready():
	assert(get_parent().has_method("hurt"))
	parent = get_parent()
	area_entered.connect(take_damage)
	
func take_damage(hit_box: Area2D):
	parent.hurt(4)
