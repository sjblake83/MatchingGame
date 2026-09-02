extends Node

@export var main_menu_music: AudioStream
@export var game_music: AudioStream
@export var click_effect: AudioStream
@export var tile_effect: AudioStream
@export var game_over_effect: AudioStream

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var effects_player: AudioStreamPlayer = $EffectsPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_tile_selected.connect(on_tile_selected)
	SignalHub.on_game_over.connect(on_game_over)
	SignalHub.on_game_exit_pressed.connect(on_game_exit_pressed)
	on_game_exit_pressed()

func play_music(stream: AudioStream) -> void:
	music_player.stream = stream
	music_player.play()

func play_effect(stream: AudioStream) -> void:
	effects_player.stream = stream
	effects_player.play()


func on_level_selected(_level_setting: LevelSetting) -> void:
	play_music(game_music)
	play_effect(tile_effect)

func on_tile_selected(_tile: MemoryTile) -> void:
	play_effect(tile_effect)

func on_game_over(_moves_taken: int) -> void:
	play_effect(game_over_effect)

func on_game_exit_pressed() -> void:
	play_music(main_menu_music)
