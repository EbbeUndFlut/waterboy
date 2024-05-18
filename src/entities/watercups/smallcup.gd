extends WaterCup

@onready var sprite:Sprite2D = $Sprite2D

enum state{EMPTY,FULL}



func _on_cup_empty():
	sprite.set_frame(state.EMPTY)
	



func _on_cup_full():
	sprite.set_frame(state.FULL)
