extends CharacterBody2D
class_name Player
@onready var Sprite : AnimatedSprite2D = get_node("AnimatedSprite2D")

const SPEED = 180.0
const JUMP_VELOCITY = -300.0

var Rolling=false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if velocity.x!=0:
		Sprite.scale.x=(abs(velocity.x)/velocity.x)
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = Math.ExpDecay(velocity.x,direction * SPEED,2,delta)
	else:
		velocity.x = Math.ExpDecay(velocity.x, 0, 20.0-19.0*float(!is_on_floor()),delta)
	move_and_slide()
