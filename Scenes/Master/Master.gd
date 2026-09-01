extends Control

@onready var main: Control = $Main
@onready var game: Control = $Game


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_game_exit_pressed.connect(on_game_exit_pressed)
	show_game(false)


func show_game(display_game: bool) -> void:
	main.visible = !display_game
	game.visible = display_game


func on_level_selected(_level_setting: LevelSetting) -> void:
	show_game(true)


func on_game_exit_pressed() -> void:
	show_game(false)
