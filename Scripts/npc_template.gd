extends Node2D
@onready var area_2d = $Area2D
@onready var dialogue_balloon = $DialogueBalloon
@onready var interact_label = $InteractLabel
@onready var animation_sprite = $AnimatedSprite2D
@export var npcName : String
@export var game_manager : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_sprite.play("default")
	interact_label.hide()
	game_manager.state_changed.connect(dialogue_balloon.state_change)
	game_manager.state_changed.connect(state_change)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	#print(body)
	if(body.is_in_group("Player")):
		body.current_interactable = npcName
		interact_label.show()

func _on_area_2d_body_exited(body):
	if(body.is_in_group("Player")):
		interact_label.hide()
		if (body.current_interactable != "NONE"):
			body.current_interactable == "NONE"

func state_change(exit_state:int, enter_state:int):
	match exit_state:
		0:
			interact_label.hide()
		1: 
			pass
		2: 
			pass
			
	match enter_state:
		0:
			interact_label.show()
		1: 
			pass
		2: 
			pass
