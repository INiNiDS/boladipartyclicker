extends Node

const SAVE_PATH: String = "user://save_game.tres"
var data: SuperSaver # YA BOY

func _ready() -> void:
	load_data()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("save"):
		save_data()
	elif Input.is_action_just_pressed("reset"):
		reset()

func save_data() -> void:
	ResourceSaver.save(data, SAVE_PATH)

func load_data() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		data = ResourceLoader.load(SAVE_PATH)
	else:
		data = SuperSaver.new()

func reset() -> void:
	data = SuperSaver.new()
	save_data()
	
# From dweaks (github.com/ininids/dweaks) Not in new update