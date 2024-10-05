extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const ACC = 30.0
const FRICTION = 20.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $Sprite2D
@onready var player_collider = $PlayerCollider

var current_interactable : String = "NONE"

func _ready():
	player_collider.add_to_group("player")
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("player_left", "player_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACC)
		sprite.flip_h = velocity.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)
	move_and_slide()
	
	if(Input.is_action_just_pressed("interact")):
		print("interacting with ", current_interactable)

