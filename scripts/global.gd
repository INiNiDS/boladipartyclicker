extends Node

var blood_1: int = 0 # Why Rider so pedantic, he gives warning if i didn't add a type
var pressed_time: int = 10

const SAVE_PATH: String = "user://save_game.cfg"

func _ready() -> void:
	load_data()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("save"):
		save_data()
	elif Input.is_action_just_pressed("reset"):
		reset()

func save_data() -> void:
	var config: ConfigFile = ConfigFile.new()
	config.load(SAVE_PATH)

	config.set_value("GameData", "blood_1", blood_1)
	config.set_value("GameData", "pressed_time", pressed_time)

	config.save(SAVE_PATH)

func load_data() -> void:
	var config: ConfigFile = ConfigFile.new()
	var err: Error = config.load(SAVE_PATH)
	if err == OK:
		config.get_value("GameData", "blood_1", 0)
		config.set_value("GameData", "pressed_time", 10)		
		

func reset() -> void:
	var config: ConfigFile = ConfigFile.new()
	config.load(SAVE_PATH)

	config.set_value("GameData", "blood_1", 0)
	config.set_value("GameData", "pressed_time", 10)

	config.save(SAVE_PATH)
	
# From dweaks (github.com/ininids/dweaks)