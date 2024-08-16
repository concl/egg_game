extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _get_drag_data(at_position):
    
    var aspect_ratio = size[0] / size[1]
    var preview_texture = TextureRect.new()
    preview_texture.texture = texture
    preview_texture.expand_mode = 1
    preview_texture.size = Vector2(400 * aspect_ratio, 400)
    set_drag_preview(preview_texture)
    
    return [self, get_parent()]
