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

# Function to save the current drawing as a PNG image
func save_drawing():
    # Create a SubViewport to render the drawing area
    var viewport = SubViewport.new()
    viewport.size = size
    viewport.render_target_clear_mode = SubViewport.CLEAR_MODE_ALWAYS
    viewport.render_target_v_flip = true  # Flip the rendering so it saves correctly
    add_child(viewport)
    
    # Create a Control to be rendered in the viewport
    var control = Control.new()
    control.size = size
    viewport.add_child(control)
    
    # Clone the lines into the control
    for line in _lines.get_children():
        var new_line = line.duplicate()
        control.add_child(new_line)
    
    # Force the viewport to update and render
    viewport.update()

    # Create an image from the viewport's content
    var img: Image = viewport.get_texture().get_image()
    
    # Save the image to a file
    var file_path = "user://drawing.png"
    img.save_png(file_path)
    
    # Clean up
    viewport.queue_free()
    
    print("Drawing saved to ", file_path)
