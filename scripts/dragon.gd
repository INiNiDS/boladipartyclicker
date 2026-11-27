extends Node2D

@onready var timer: Timer = $Timer
@onready var texture_button: TextureButton = $TextureButton
@onready var texture_hp: TextureProgressBar = $TextureProgressBar
@onready var attack: TextureProgressBar = $TextureProgressBar2
@onready var bone: TextureRect = $Bone
@onready var label: Label = $Hint
@onready var spawn_timer: Timer = $SpawnTimer
@onready var reaction_timer: Timer = $ReactionTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_hp.value = global.data.current_hp
	bone.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not timer.is_stopped():
		attack.show()
		attack.value = timer.wait_time - timer.time_left
	else:
		attack.hide()
		attack.value = 0

func _on_texture_button_mouse_exited() -> void:
	if not bone.visible:
		timer.stop()
		spawn_timer.stop()
		reaction_timer.stop()
		bone.hide()
		label.hide()

func _on_texture_button_button_up() -> void:
	timer.stop()
	spawn_timer.stop()
	reaction_timer.stop()
	bone.hide()
	label.hide()

func _on_texture_button_button_down() -> void:
	timer.wait_time = global.data.pressed_time
	attack.max_value = global.data.pressed_time
	timer.start()
	if randf() < 0.1:
		spawn_timer.wait_time = randf_range(1.5,  global.data.pressed_time - 2.0)
		spawn_timer.start()
		
		
	
func _on_timer_timeout() -> void:
	global.data.current_hp -= 10
	texture_hp.set_value(global.data.current_hp)
	if global.data.current_hp <= 0:
		if global.data.dragons >= 1:
			global.data.dragons -= 1
			global.data.current_hp = 200.0
		else:
			global.reset()
			get_tree().change_scene_to_file("res://scenes/fail.tscn")
		spawn_timer.stop()
		reaction_timer.stop()
		bone.hide()
		label.hide()
	global.data.blood_1 += global.data.blood_for_one

func _on_reaction_timer_timeout() -> void:
	timer.stop()
	spawn_timer.stop()
	reaction_timer.stop()
	label.hide()
	bone.hide()

func _on_spawn_timer_timeout() -> void:
	bone.show()
	label.show()
	reaction_timer.start()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		if bone.visible:
			reaction_timer.stop()
			bone.hide()
			label.hide()