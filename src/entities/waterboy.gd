class_name WaterBoy
extends CharacterBody2D

signal main

const SPEED = 300.0

var target:SoccerPlayer=null
var station:WaterStation=null
@export var cup:WaterCup

func _ready():
	pass

func _process(delta):
	
	if target and Input.is_action_just_pressed("ui_accept"):
		target.set_thirst(target.get_thirst()-cup._use())
	if station and Input.is_action_just_pressed("ui_accept"):
		cup._refill()

func _physics_process(delta):
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("LEFT", "RIGHT")
	if direction and Input.is_action_pressed("alt"):
		velocity.x = direction * (SPEED*2)
		
	
		
	elif direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var direction_y = Input.get_axis("UP", "DOWN")
	
	if direction_y and Input.is_action_just_pressed("alt"):
		velocity.y = direction_y * (SPEED*2)
	elif direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_action_area_body_entered(body):
	if target == null:
		target = body as SoccerPlayer
		if target:
			target.changeHighlight()
	station = body as WaterStation


func _on_action_area_body_exited(body):
	if body == target:
		target.changeHighlight()
		target = null
	elif body == station:
		station == null
	


func _on_button_button_down():
	emit_signal("main")# Replace with function body.
