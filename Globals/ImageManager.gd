extends Node

const TILE_IMAGES: TileImagesHolder = preload("uid://2xxf0m46m7mx")
const FRAME_IMAGES: Array[Texture2D] = [
	preload("uid://cs1m653cm42je"),
	preload("uid://cdgif44p6eoh6"),
	preload("uid://3ohsn723st3t"),
	preload("uid://bvew7llcrjims")
]

func get_random_frame_image() -> Texture2D:
	return FRAME_IMAGES.pick_random()

func get_random_item_image() -> Texture2D:
	return TILE_IMAGES.tile_images.pick_random()

func shuffle_images() -> void:
	TILE_IMAGES.tile_images.shuffle()

func get_image_at_index(index: int) -> Texture2D:
	if index > TILE_IMAGES.tile_images.size() or index < 0:
		printerr("get_image_at_index index issue: ", index)
	return TILE_IMAGES.tile_images[index]
