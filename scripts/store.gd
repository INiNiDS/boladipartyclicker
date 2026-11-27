extends Node2D

@onready var coins_label: Label = $Panel/Coins/Label
@onready var faster_label: Label = $Panel/Faster/Label
@onready var more_blood_label: Label = $Panel/MoreBlood/Label
@onready var new_dragon_label: Label = $Panel/NewDragon/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	faster_label.set_text(str(global.data.faster_cost))
	more_blood_label.set_text(str(global.data.more_blood_cost))
	new_dragon_label.set_text(str(global.data.new_dragon_cost))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_new_dragon_pressed() -> void:
	if global.data.coins >= global.data.new_dragon_cost:
		global.data.coins -= global.data.new_dragon_cost
		global.data.dragons += 1

func _on_more_blood_pressed() -> void:
	if global.data.coins >= global.data.more_blood_cost:
		global.data.coins -= global.data.more_blood_cost
		global.data.blood_for_one += 1

func _on_faster_pressed() -> void:
	if global.data.coins >= global.data.faster_cost and not global.data.pressed_time <= 1.0:
		global.data.coins -= global.data.faster_cost
		global.data.pressed_time -= 0.2

func _on_coins_pressed() -> void:
	if global.data.blood_1 >= 1:
		global.data.blood_1 -= 1
		global.data.coins += 10
