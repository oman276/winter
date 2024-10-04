extends Node2D
#var InkPlayer = load("res://addons/inkgd/ink_player.gd")
@onready var _ink_player = InkPlayer.new()
@onready var dialogue_box = $DialogueBox
@onready var choice_btn = load("res://Scenes/Systems/choice_button.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(_ink_player)
	_ink_player.ink_file = load("res://Ink Scripts/test2.ink.json")
	_ink_player.loads_in_background = true
	#_ink_player.connect("loaded", self, "_story_loaded")
	_ink_player.loaded.connect(_story_loaded)
	_ink_player.create_story()
	pass # Replace with function body.

func _story_loaded(successfully:bool):
	if !successfully:
		return
	_continue_story()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _select_choice(selection:int):
	_ink_player.choose_choice_index(selection)
	_continue_story()

func _continue_story():
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()
		dialogue_box.add_text(text)
	if _ink_player.has_choices:
		#dialogue_box.hide_textbox()
		var choice_index = 0;
		for choice in _ink_player.current_choices:
			#print(choice)
			var button = choice_btn.instantiate()
			button.text = choice.text
			button.pressed.connect(_select_choice.bind(choice_index))
			choice_index += 1
			dialogue_box.add_choice(button)
			
		#_select_choice(0)
	else:
		print("The End")
