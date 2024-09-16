extends Control

@onready var drawing_canvas: TextureRect = $DrawingElement/DrawingCanvas
@onready var next_page: Button = $NextPage

var seen_dialogue = false

func play_dialogue():
    if not seen_dialogue:
        seen_dialogue = true
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "page_5_dialogue")

func win():
    State.page_5_done()
    next_page.visible = true
    disable_ui_for_all_children(self)
    
func _on_save_button_pressed() -> void:
    drawing_canvas.save_drawing("second.png")
    win()


# Function to disable UI response for all children
func disable_ui_for_all_children(parent: Node):
    for child in parent.get_children():
        if child is Control and not (child is ArrowButton):
            child.mouse_filter = Control.MOUSE_FILTER_IGNORE
        if child is TextureRect:
            child.material = State.apply_grayscale_shader_to_texture(child.texture)
        if child is Button:
            child.material = State.apply_grayscale_shader_to_texture(child.icon)
        # Recursively call the function for children of the current child
        disable_ui_for_all_children(child)
