extends Control

const MEMORY_TILE: PackedScene = preload("uid://gqnaf4gvi0gd")

@onready var grid_container: GridContainer = $HB/GridContainer
@onready var scorer: Scorer = $Scorer

@onready var moves_label: Label = $HB/VB/HB/MovesLabel
@onready var pairs_label: Label = $HB/VB/HB2/PairsLabel
@onready var game_over_ui: PanelContainer = $MarginContainer/GameOverUi

var lvl_tile_count: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_moves_updated.connect(on_moves_updated)
	SignalHub.on_pairs_updated.connect(on_pairs_updated)
	SignalHub.on_game_over.connect(on_game_over)

func on_level_selected(level_setting: LevelSetting) -> void:
	prepare_game_board(level_setting)

func prepare_game_board(lvl_setting: LevelSetting) -> void:
	var lds: LevelDataSelector = LevelDataSelector.new()
	var selected_images = lds.get_images_for_level(lvl_setting)
	var frame_image: Texture2D = ImageManager.get_random_frame_image()
	
	grid_container.columns = lvl_setting.cols
	for image in selected_images:
		var new_tile: MemoryTile = MEMORY_TILE.instantiate()
		grid_container.add_child(new_tile)
		new_tile.setup(image, frame_image)
	
	scorer.clear_new_game(lvl_setting.target_pairs)

func _on_exit_button_pressed() -> void:
	for t in grid_container.get_children():
		t.queue_free()
		game_over_ui.hide()
		SignalHub.emit_on_game_exit_pressed()

func on_moves_updated(moves: int) -> void:
	moves_label.text = "%d" % moves

func on_pairs_updated(pairs: int, target_pairs: int) -> void:
	pairs_label.text = "%d / %d" % [pairs, target_pairs]

func on_game_over(moves_taken) -> void:
	game_over_ui.show()
	game_over_ui.set_moves_label(moves_taken)
