extends Node2D

@onready var balloon = $Balloon
@onready var text = $Balloon/Text
@onready var choices = $Balloon/Choices
@onready var activeButtons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_balloon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hide_balloon():
	text.text = ""
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
