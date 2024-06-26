class_name SoccerPlayer
extends RigidBody2D

@export var team:Teams
@export var SPEED:float = 30
@export var state:State = State.ACTIVE


@onready var water:Sprite2D = $water
@onready var progress:ProgressBar = $ProgressBar
@onready var danger_timer:Timer = $DangerTime
@onready var animation:AnimationPlayer = $AnimationPlayer
@onready var highlight:Sprite2D = $HighLightSprite

enum Teams {BLUE,RED}
enum State {ACTIVE,DANGER,DEAD}

var direction:Vector2=Vector2(4,1)
var thirst:float = 0
var multiplier: float = 1
var speed:int= 10
var accurancy:int=5
var can_drink:bool = false
var can_do:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	multiplier = randf_range(0.5,15)
	print(direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_do:
		if state != State.DEAD:
			if thirst < 100:
				thirst += 1 * delta * multiplier
			if thirst >= 80:
				water.visible = true
			if thirst <=50 and water.visible:
				water.visible = false
			if thirst >= 100 and state == State.ACTIVE:
				state = State.DANGER
				danger_timer.start()
			progress.value =thirst
			

func _physics_process(delta):
	if can_do:
		if state != State.DEAD:
			apply_force(direction)
	
func get_thirst()->float:
	return thirst

func set_thirst(value:float)->void:
	
	thirst = value
	
func _on_drink_area_body_entered(body):
	var waterboy = body as WaterBoy
	if waterboy:
		can_drink = true


func _on_drink_area_body_exited(body):
	var waterboy = body as WaterBoy
	if waterboy:
		can_drink = false


func _on_timer_timeout():
	if state != State.DEAD:
		freeze = true
		direction = Vector2(randf_range(-1,1)*SPEED,randf_range(-1,1)*SPEED)
		freeze=false


func _on_danger_time_timeout():
	if thirst >= 100:
		state = State.DEAD 
		freeze=true
		animation.set_current_animation("dead")
	else:
		state = State.ACTIVE


func _on_body_entered(body):
	direction = Vector2(randf_range(-1,1)*SPEED,randf_range(-1,1)*SPEED)



func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	direction = Vector2(randf_range(-1,1)*SPEED,randf_range(-1,1)*SPEED)

func anpfiff()->void:
	can_do = true
	animation.set_current_animation("running")

func changeHighlight()->void:
	highlight.visible = !highlight.visible
