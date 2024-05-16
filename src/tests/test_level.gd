extends Node2D

@onready var music:AudioStreamPlayer = $Music
@onready var anpfiff:AudioStreamPlayer = $Anpiff

# Called when the node enters the scene tree for the first time.

func _on_anpiff_finished():
	music.play()
	get_tree().call_group("soccer","anpfiff")
