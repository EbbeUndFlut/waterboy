class_name WaterBoy
extends CharacterBody2D


const SPEED = 300.0




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
