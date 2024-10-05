extends Node2D
@onready var area_2d = $Area2D
@onready var dialogue_balloon = $DialogueBalloon
@onready var interact_label = $InteractLabel

@export var npcName : String

# Called when the node enters the scene tree for the first time.
func _ready():
	interact_label.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	#print(body)
	if(body.is_in_group("Player")):
		print("player entered")
		body.current_interactable = npcName
		interact_label.show()

func _on_area_2d_body_exited(body):
	if(body.is_in_group("Player")):
		print("player exited")
		interact_label.hide()
		if (body.current_interactable != "NONE"):
			body.current_interactable == "NONE"
