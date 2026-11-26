extends Node2D

@onready var timer: Timer = $Timer
@onready var texture_button: TextureButton = $TextureButton
@onready var texture_hp: TextureProgressBar = $TextureProgressBar
@onready var attack: TextureProgressBar = $TextureProgressBar2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_hp.value = global.data.current_hp
	

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
	timer.wait_time = global.data.pressed_time
	attack.max_value = global.data.pressed_time
	timer.start()
	
func _on_timer_timeout() -> void:
	global.data.current_hp -= 10
	texture_hp.set_value(global.data.current_hp)
	if global.data.current_hp <= 0:
		texture_button.disabled = true
		texture_button.queue_free()
	global.data.blood_1 += 1
