extends CanvasLayer

@onready var textbox_container = $MarginContainer
@onready var text_label = $MarginContainer/MarginContainer/VBoxContainer/Label
@onready var choice_btn = load("res://Scenes/Systems/choice_button.tscn")
@onready var activeButtons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()
	pass

func hide_textbox():
	text_label.text = ""
	textbox_container.hide()

func show_textbox():
	textbox_container.show()
	
func add_text(next_text:String):
	for button in activeButtons:
		button.queue_free()
	activeButtons.clear()
	text_label.text = next_text
	show_textbox()

func add_choice(btn_obj):
	$MarginContainer/MarginContainer/VBoxContainer.add_child(btn_obj)
	activeButtons.insert(activeButtons.size(), btn_obj)
