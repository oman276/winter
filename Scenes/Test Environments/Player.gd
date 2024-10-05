extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const ACC = 30.0
const FRICTION = 20.0

var ink_player = preload("res://Scenes/Test Environments/ink_player.gd")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $Sprite2D
@onready var player_collider = $PlayerCollider
@onready var dialogue_balloon = $DialogueBalloon

@export var game_manager : Node

var current_interactable : String = "NONE"

func _ready():
	player_collider.add_to_group("player")
	dialogue_balloon.is_player = true
	game_manager.state_changed.connect(dialogue_balloon.state_change)
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = Input.get_axis("player_left", "player_right")
	if direction && game_manager.currentState == ink_player.GameState.FREE:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACC)
		sprite.flip_h = velocity.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)
	move_and_slide()
	
	if(Input.is_action_just_pressed("interact")):
		var state = game_manager.currentState
		if(state == ink_player.GameState.FREE):
			print("interacting with ", current_interactable)
			if(game_manager):
				game_manager.enter_dialogue(current_interactable)
			else:
				print("ERROR: no game manager")
		elif (state == ink_player.GameState.NPC_DIALOGUE):
			game_manager._select_choice(0)
