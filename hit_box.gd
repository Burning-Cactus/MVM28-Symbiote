class_name HitBox
extends Area2D

var parent: Node2D

var strength: float

func _ready():
	parent = get_parent()
	
	area_entered.connect(deal_damage)

func deal_damage(hurt_box: HurtBox):
	hurt_box.take_damage(4)
