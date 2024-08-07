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
