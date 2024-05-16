class_name Enemy
extends RigidBody2D

@export var SPEED:float = 60
var waterboy
var direction:Vector2=Vector2(randf_range(-1,1)*SPEED,randf_range(-1,1)*SPEED)
var state :State =State.IDLE
var boost_duration:float = 6
var time_to_boost:float = 5
var actual_time:float=0
var boost :bool = false
enum State {IDLE,CHASE}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	actual_time += delta
	if actual_time >= time_to_boost and not boost:
		SPEED = SPEED * 3
		boost = true
		actual_time = 0
	if actual_time >=boost_duration and boost:
		SPEED = SPEED /3
		boost=false
		actual_time = 0

func _physics_process(delta):
	if state == State.CHASE:
		direction = position.direction_to(waterboy.position) * SPEED
	apply_force(direction)


func _on_direction_timer_timeout():
	if state == State.IDLE:
		direction = Vector2(randf_range(-1,1)*SPEED,randf_range(-1,1)*SPEED)


func _on_area_2d_body_entered(body):
	var target = body as WaterBoy
	if target:
		waterboy = target
		state = State.CHASE

func _on_area_2d_body_exited(body):
	var target = body as WaterBoy
	if target:
		waterboy = null
		state = State.IDLE


func _on_body_entered(body):
	direction = Vector2(randf_range(-1,1)*SPEED,randf_range(-1,1)*SPEED)
