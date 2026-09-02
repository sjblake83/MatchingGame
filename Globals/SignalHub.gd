extends Node


signal on_level_selected(level_setting: LevelSetting)
signal on_game_exit_pressed
signal on_tile_selected(tile: MemoryTile)
signal on_moves_updated(moves: int)
signal on_pairs_updated(pairs: int, target_pairs: int)
signal on_game_over(moves_taken: int)

func emit_on_level_selected(level_setting: LevelSetting) -> void:
	on_level_selected.emit(level_setting)

func emit_on_game_exit_pressed() -> void:
	on_game_exit_pressed.emit()

func emit_on_tile_selected(tile: MemoryTile) -> void:
	on_tile_selected.emit(tile)

func emit_on_moves_updated(moves: int) -> void:
	on_moves_updated.emit(moves)

func emit_on_pairs_updated(pairs: int, target_pairs: int) -> void:
	on_pairs_updated.emit(pairs, target_pairs)

func emit_on_game_over(moves_taken: int) -> void:
	on_game_over.emit(moves_taken)
