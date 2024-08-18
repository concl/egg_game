extends Control

@onready var valuable = $Valuable
@onready var not_valuable = $NotValuable
@onready var next_page = $NextPage

var solved = false

var items_found = 0
var valuable_items = {}
var not_valuable_items = {}

var seen_dialogue = false

func play_dialogue():
    if solved:
        return
    
    if !seen_dialogue:
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_2_dialogue")
        seen_dialogue = true
    else:
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_2_again")
        await State.dialogue_ended
        

func check_win():
    if items_found == State.total_items_page_2 and valuable_items == State.correct_valuable_items:
        disable_ui_for_all_children(self)
        next_page.visible = true
        # handle other stuff
        solved = true
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_2_win")
        

# Function to disable UI response for all children
func disable_ui_for_all_children(parent: Node):
    for child in parent.get_children():
        if child is Control and not (child is Button):
            child.mouse_filter = Control.MOUSE_FILTER_IGNORE
        if child is TextureRect:
            child.material = State.apply_grayscale_shader_to_texture(child.texture)
        # Recursively call the function for children of the current child
        disable_ui_for_all_children(child)
