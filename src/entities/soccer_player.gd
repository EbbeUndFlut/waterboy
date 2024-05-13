class_name SoccerPlayer
extends RigidBody2D

enum Teams {BLUE,RED}
@onready var water:Sprite2D = $water
@export var team:Teams
@onready var progress:ProgressBar = $ProgressBar
var thirst:float = 0
@export var multiplier: float = 1
var speed:int= 10
var accurancy:int=5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	thirst += 1 * delta * multiplier
	print(thirst)
	if thirst >= 80:
		water.visible = true
	if thirst <=50 and water.visible:
		water.visible = false
	progress.value =thirst
	

func _input(event):
	if event.is_action_pressed("ui_accept"):
		thirst = 0
