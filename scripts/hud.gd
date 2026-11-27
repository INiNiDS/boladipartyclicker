extends CanvasLayer

@onready var label: Label = $Label
@onready var label2: Label = $Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_label()

func update_label() -> void:
	label.set_text(str(global.data.blood_1))
	label2.set_text(str(global.data.coins))
