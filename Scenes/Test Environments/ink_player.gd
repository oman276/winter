extends Node2D

enum GameState {
	FREE,
	NPC_DIALOGUE,
	PLAYER_DIALOGUE
}
signal state_changed

#var InkPlayer = load("res://addons/inkgd/ink_player.gd")
@onready var _ink_player = InkPlayer.new()
#@onready var dialogue_box = $DialogueBox
@onready var choice_btn = load("res://Scenes/Systems/choice_button.tscn")
@onready var currentState = GameState.FREE

var dialogue_balloon
@onready var player = $Player
var player_balloon

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(_ink_player)
	_ink_player.ink_file = load("res://Ink Scripts/demo_v1.json")
	_ink_player.loads_in_background = true
	#_ink_player.connect("loaded", self, "_story_loaded")
	_ink_player.loaded.connect(_story_loaded)
	_ink_player.create_story()
	player_balloon = player.get_node("DialogueBalloon")

func _story_loaded(successfully:bool):
	if !successfully:
		return
	_observe_variables()
	_continue_story()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _select_choice(selection:int):
	for c in _ink_player.current_choices:
		print(c.text)
	_ink_player.choose_choice_index(selection)
	_continue_story()

func _continue_story():
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()
		#print(text)
		if(dialogue_balloon && text != ""):
			dialogue_balloon.add_text(text)
			dialogue_balloon.show()
	if _ink_player.has_choices && currentState == GameState.PLAYER_DIALOGUE:
		var choice_index = 0;
		for choice in _ink_player.current_choices:
			var button = choice_btn.instantiate()
			button.text = "\"" + choice.text + "\""
			button.pressed.connect(_select_choice.bind(choice_index))
			choice_index += 1
			if(player_balloon):
				player_balloon.add_choice(button)
				player_balloon.show()
	else:
		print("No Further Actions")

func _observe_variables():
	_ink_player.observe_variables(["test_int", "test_bool", "state"], self, "_variable_changed")
	
func  _variable_changed(variable_name, new_value):
	print("Variable ", variable_name, " changed to ", new_value)
	match variable_name:
		"state":
			if (currentState != new_value):
				emit_signal("state_changed", currentState, new_value)
				currentState = new_value
	
func enter_dialogue(branch:String):
	if(currentState != GameState.FREE):
		push_error("attempting to enter dialogue when not in free state?")
		return
	match branch:
		"Test":
			dialogue_balloon = $Nurse.get_node("DialogueBalloon")
			_select_choice(0)
		"DemoMedic":
			dialogue_balloon = $Nurse.get_node("DialogueBalloon")
			_select_choice(1)
		var other:
			print("non-existent NPC access attempted: ", other)
	if(!dialogue_balloon):
		print("joever")
