extends Node2D

@export var hp: int = 200
@onready var timer: Timer = $Timer
@onready var texture_button: TextureButton = $TextureButton
@onready var texture_hp: TextureProgressBar = $TextureProgressBar
@onready var attack: TextureProgressBar = $TextureProgressBar2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not timer.is_stopped():
		attack.show()
		attack.value = timer.wait_time - timer.time_left
	else:
		attack.hide()
		attack.value = 0

func _on_texture_button_mouse_exited() -> void:
	timer.stop()

func _on_texture_button_button_up() -> void:
	timer.stop()

func _on_texture_button_button_down() -> void:
	timer.wait_time = global.pressed_time
	attack.max_value = global.pressed_time
	timer.start()
	
func _on_timer_timeout() -> void:
	hp -= 10
	texture_hp.set_value(hp)
	if hp <= 0:
		texture_button.disabled = true
		texture_button.queue_free()
	global.blood_1 += 1