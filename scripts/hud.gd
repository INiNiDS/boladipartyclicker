extends CanvasLayer

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_label()

func update_label() -> void:
	label.set_text(str(global.blood_1))