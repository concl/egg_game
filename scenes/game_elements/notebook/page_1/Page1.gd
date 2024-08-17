extends Control

const BALLOON = preload("res://dialogue/balloon.tscn")
@onready var first = $First
@onready var second = $Second
@onready var third = $Third
@onready var fourth = $Fourth
@onready var fifth = $Fifth
@onready var next_page = $NextPage


func _can_drop_data(at_position, data):
    return data[0] is Texture2D

func _drop_data(at_position, data):
    data[1].glow.self_modulate = 0
    
var solved = false
var order = [1,2,3,4,5]

var seen_dialogue = false

func play_dialogue():
    if solved:
        return
    
    if !seen_dialogue:
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_2_dialogue")
        seen_dialogue = true
    else:
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_2_again")


func check_win():
    if order == State.correct_order:
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_1_win")
        disable_ui_for_all_children(self)
        
        # Change state
        solved = true
        State.first_book_page_solved = true
        next_page.visible = true

# Function to disable UI response for all children
func disable_ui_for_all_children(parent: Node):
    for child in parent.get_children():
        if child is Control and not (child is Button):
            child.mouse_filter = Control.MOUSE_FILTER_IGNORE
        if child is TextureRect:
            child.material = State.apply_grayscale_shader_to_texture(child.texture)
        # Recursively call the function for children of the current child
        disable_ui_for_all_children(child)
