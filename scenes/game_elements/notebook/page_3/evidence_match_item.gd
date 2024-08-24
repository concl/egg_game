extends TextureRect

var is_slot = false
@export var item_number: int

func _get_drag_data(at_position):
    
    var aspect_ratio = size[0] / size[1]
    var preview_texture = TextureRect.new()
    preview_texture.texture = texture
    preview_texture.expand_mode = 1
    preview_texture.size = Vector2(400 * aspect_ratio, 400)
    set_drag_preview(preview_texture)
    
    return [texture, self]
