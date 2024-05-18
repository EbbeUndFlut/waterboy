class_name WaterCup
extends Node

signal cup_empty
signal cup_full
@export var charges:int
@export var anti_thirst_amount:float

var charged_times:int

func _refill()->void:
	charged_times = 0
	emit_signal("cup_full")

func _use()->float:
	if charged_times < charges:
		charged_times += 1
		if charged_times == charges:
			emit_signal("cup_empty")
		return anti_thirst_amount
	else:
		return 0
	
