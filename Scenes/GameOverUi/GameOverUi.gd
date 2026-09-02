extends PanelContainer

@onready var moves_label: Label = $VBoxContainer/MovesLabel

func set_moves_label(moves: int) -> void:
	moves_label.text = "You took %d moves, well done!" % moves
