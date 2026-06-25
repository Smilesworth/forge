extends CharacterBody2D

const SPEED = 300.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Get the input directionX: -1, 0, 1
	var directionX := Input.get_axis("left", "right")
	
	# Get the input directionY: -1, 0, 1
	var directionY := Input.get_axis("up", "down")
	
	# Flip character on horizontal movement
	if directionX > 0:
		animated_sprite.flip_h = true
	elif directionX < 0:
		animated_sprite.flip_h = false
	
	# Apply movement animations
	if not(directionX == 0) and directionY > 0:
		animated_sprite.play("run-diagonal-front")
	elif not(directionX == 0) and directionY < 0:
		animated_sprite.play("run-diagonal-back")
	elif directionX == 0 and directionY == 0:
		animated_sprite.play("idle-front")
	elif not(directionX == 0) and directionY == 0:
		animated_sprite.play("run")
	elif directionX == 0 and directionY < 0:
		animated_sprite.play("run-back")
	elif directionX == 0 and directionY > 0:
		animated_sprite.play("run-front")
	
	# Apply horizontal movement
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Apply vertical movement
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
