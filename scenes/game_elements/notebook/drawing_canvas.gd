extends TextureRect

@onready var _lines = $Line2D

var _pressed = false
var _current_line: Line2D = null

func _input(event):
    if not visible:
        return
    
    var mouse_pos = get_global_mouse_position()
    var rect = Rect2(global_position, size)
    if rect.has_point(mouse_pos):
        if event is InputEventMouseButton:
            if event.button_index == MOUSE_BUTTON_LEFT:
                _pressed = event.pressed
                
                if _pressed:
                    _current_line = Line2D.new()
                    _current_line.default_color = Color.BLACK
                    _current_line.width = 3
                    _lines.add_child(_current_line)
                    _current_line.add_point(event.position - global_position)
        elif event is InputEventMouseMotion and _pressed:
            _current_line.add_point(event.position - global_position)
    else:
        _pressed = false

func save_drawing():
    # Capture the entire viewport as an image
    var capture = get_viewport().get_texture().get_image()

    # Define the area to crop (the bounds of the TextureRect)
    var crop_rect = Rect2i(global_position, size)
    
     # Create a new image with the desired crop size

    var cropped_image = Image.new()
    cropped_image.create(crop_rect.size.x, crop_rect.size.y, false, capture.get_format())
    
    # Copy the desired region from the original image to the new image
    cropped_image.blit_rect(capture, crop_rect, Vector2(0, 0))
    
    var filename = "user://thing.png"
    cropped_image.save_png(filename)
