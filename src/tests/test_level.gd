extends Node2D

@onready var music:AudioStreamPlayer = $Music
@onready var anpfiff:AudioStreamPlayer = $Anpiff

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_anpiff_finished():
	music.play()
