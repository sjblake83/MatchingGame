class_name  MemoryTile

extends TextureButton

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage


func setup(image: Texture2D, frame: Texture2D) -> void:
	item_image.texture = image
	frame_image.texture = frame
	reveal(false)

func matches_other_tile(other: MemoryTile) -> bool:
	return other != self && other.item_image.texture == item_image.texture

func kill_on_pair() -> void:
	z_index = 10
	disabled = true
	var tween: Tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "rotation_degrees", 360, 0.5)
	tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.5)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.2)

func reveal(r: bool) -> void:
	frame_image.visible = r
	item_image.visible = r

func _on_pressed() -> void:
	if !Scorer.SelectionEnabled: return
	reveal(true)
	SignalHub.emit_on_tile_selected(self)
