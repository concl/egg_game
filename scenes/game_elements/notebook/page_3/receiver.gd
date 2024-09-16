extends TextureRect

signal dropped
@onready var default_texture = texture

var is_slot = true
var has_item = false
var item_number: int

func _get_drag_data(at_position: Vector2) -> Variant:
    if !has_item:
        return
    
    var aspect_ratio = size[0] / size[1]
    var preview_texture = TextureRect.new()
    preview_texture.texture = texture
    preview_texture.expand_mode = 1
    preview_texture.size = Vector2(400 * aspect_ratio, 400)
    set_drag_preview(preview_texture)
    
    var to_drop = texture
    return [to_drop, self]

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
    if !data[1].is_slot and has_item:
        return false
    return data[0] is Texture

func _drop_data(at_position: Vector2, data: Variant) -> void:
    
    State.play_sound("res://assets/sounds/effects/notebook_sound_effect.wav")
    if data[1].is_slot:
        if has_item: # swap textures
            data[1].texture = texture
            texture = data[0]
            
            var temp = item_number
            item_number = data[1].item_number
            data[1].item_number = temp
        else:
            data[1].texture = default_texture
            
            item_number = data[1].item_number
            texture = data[0]
            has_item = true
            data[1].has_item = false
    else:
        if has_item:
            return
        texture = data[0]
        item_number = data[1].item_number
        has_item = true
        data[1].queue_free()
    
    dropped.emit()
            
            
        
    
    
