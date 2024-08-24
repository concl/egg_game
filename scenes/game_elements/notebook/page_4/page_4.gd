extends Control

@onready var drawing_canvas: TextureRect = $DrawingElement/DrawingCanvas
@onready var next_page: Button = $NextPage

func play_dialogue():
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "page_4_dialogue")

func win():
    State.page_4_done()
    next_page.visible = true
    disable_ui_for_all_children(self)
    

func _on_save_button_pressed() -> void:
    drawing_canvas.save_drawing("first.png")
    win()


# Function to disable UI response for all children
func disable_ui_for_all_children(parent: Node):
    for child in parent.get_children():
        if child is Control and not (child is Button):
            child.mouse_filter = Control.MOUSE_FILTER_IGNORE
        if child is TextureRect:
            child.material = State.apply_grayscale_shader_to_texture(child.texture)
        # Recursively call the function for children of the current child
        disable_ui_for_all_children(child)
