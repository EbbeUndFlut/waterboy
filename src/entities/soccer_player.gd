class_name SoccerPlayer
extends RigidBody2D

enum Teams {BLUE,RED}
@onready var water:Sprite2D = $water
@export var team:Teams
@onready var progress:ProgressBar = $ProgressBar
var thirst:float = 0
var multiplier: float = 1
var speed:int= 10
var accurancy:int=5
var can_drink:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	multiplier = randf_range(0.5,15)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	thirst += 1 * delta * multiplier
	if thirst >= 80:
		water.visible = true
	if thirst <=50 and water.visible:
		water.visible = false
	progress.value =thirst
	
	if can_drink and Input.is_action_just_pressed("ui_accept"):
		thirst = 0

func _on_drink_area_body_entered(body):
	var waterboy = body as WaterBoy
	if waterboy:
		can_drink = true


func _on_drink_area_body_exited(body):
	var waterboy = body as WaterBoy
	if waterboy:
		can_drink = false
