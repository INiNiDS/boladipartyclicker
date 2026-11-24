extends Node2D

var pressed: bool = false
var pending: int = 0
@export var hp: int = 200
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = global.pressed_time
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_mouse_exited() -> void:
	timer.stop()

func _on_texture_button_button_up() -> void:
	timer.stop()

func _on_texture_button_button_down() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	pass