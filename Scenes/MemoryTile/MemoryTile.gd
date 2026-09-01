class_name  MemoryTile

extends TextureButton

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage


func setup(image: Texture2D, frame: Texture2D) -> void:
	item_image.texture = image
	frame_image.texture = frame
	reveal(false)
	

func reveal(r: bool) -> void:
	frame_image.visible = r
	item_image.visible = r


func _on_pressed() -> void:
	reveal(true)
