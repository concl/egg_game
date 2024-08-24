extends Control

var solved = false

@onready var receiver1: TextureRect = $Suspect1/VBoxContainer/Receiver
@onready var receiver2: TextureRect = $Suspect2/VBoxContainer/Receiver
@onready var receiver3: TextureRect = $Suspect3/VBoxContainer/Receiver
@onready var next_page: Button = $NextPage


func check_win():
    var receiver1_good = receiver1.has_item and receiver1.item_number == 0
    var receiver2_good = receiver2.has_item and receiver2.item_number == 1
    var receiver3_good = receiver3.has_item and receiver3.item_number == 2
    
    if receiver1_good and receiver2_good and receiver3_good:
        disable_ui_for_all_children(self)
        solved = true
        next_page.visible = true
        State.page_3_done()

        
    
func play_dialogue():
    if solved:
        return
    
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_3_dialogue")
    

func _on_receiver_dropped() -> void:
    check_win()

# Function to disable UI response for all children
func disable_ui_for_all_children(parent: Node):
    for child in parent.get_children():
        if child is Control and not (child is Button):
            child.mouse_filter = Control.MOUSE_FILTER_IGNORE
        if child is TextureRect:
            child.material = State.apply_grayscale_shader_to_texture(child.texture)
        # Recursively call the function for children of the current child
        disable_ui_for_all_children(child)
