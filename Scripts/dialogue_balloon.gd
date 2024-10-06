extends Node2D

@onready var balloon = $Balloon
@onready var text = $Balloon/Text
@onready var choices = $Balloon/Choices
@onready var activeButtons = []

@onready var is_player : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_balloon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hide_balloon():
	text.text = ""
	for button in activeButtons:
		button.queue_free()
	activeButtons.clear()
	balloon.hide()

func add_text(next_text:String):
	for button in activeButtons:
		button.queue_free()
	activeButtons.clear()
	text.text = next_text
	show_balloon()
	
func show_balloon():
	balloon.show()
	
func add_choice(btn_obj):
	$Balloon/Choices.add_child(btn_obj)
	activeButtons.insert(activeButtons.size(), btn_obj)
	show_balloon()

func state_change(exit_state:int, enter_state:int):
	print("state change ", exit_state, " ", enter_state)
	match exit_state:
		0:
			pass
		1 when not is_player: 
			hide_balloon()
		2 when is_player: 
			hide_balloon()
			
	match enter_state:
		0:
			hide_balloon()
		1: 
			pass
		2: 
			pass
