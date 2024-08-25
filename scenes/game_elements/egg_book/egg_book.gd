extends Control
@onready var next_page_button: Button = $Contents/NextPage
@onready var pages = [$Contents, $Page1, $Page2, $Page3]
var current_page = 0

var seen = false

func enable_other_pages():
    next_page_button.visible = true

func next_page():
    if current_page >= len(pages):
        return
    
    current_page += 1
    pages[current_page - 1].visible = false
    pages[current_page].visible = true
    
    if not seen and current_page == 3:
        seen = true
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","new_birth")
    
    
    State.play_sound("res://assets/sounds/effects/page_flip.wav")

func prev_page():
    if current_page <= 0:
        return
    
    current_page -= 1
    pages[current_page + 1].visible = false
    pages[current_page].visible = true
    State.play_sound("res://assets/sounds/effects/page_flip.wav")
