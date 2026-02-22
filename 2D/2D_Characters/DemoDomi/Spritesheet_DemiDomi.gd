extends CharacterBody2D

@onready var demi_domi_animation: AnimatedSprite2D = $DemiDomi_Animation


const SPEED : float = 300.0
const JUMP_VELOCITY : float = -850.0

func _physics_process(delta: float) -> void:
	#Add Turn Animation.
	if velocity.x > 1 or velocity.x < -1 :
		demi_domi_animation.animation = "run"
	else:
		demi_domi_animation.animation = "idle"
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y > 0:
			$DemiDomi_Animation.animation = "jump_down"
		else :
			$DemiDomi_Animation.animation = "jump_up"
	
		
	# Handle Jump.
	if Input.is_action_just_pressed("Move_Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI action with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	if direction == 1.0:
		demi_domi_animation.flip_h = false
	elif direction == -1.0:
		demi_domi_animation.flip_h = true
	
