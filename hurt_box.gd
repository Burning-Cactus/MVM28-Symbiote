class_name HurtBox
extends Area2D

signal hurt(damage: float)
	
func take_damage(damage: float):
	hurt.emit(damage)
