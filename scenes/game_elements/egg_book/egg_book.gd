extends Control
@onready var next_page_button: Button = $Contents/NextPage
@onready var pages = [$Contents, $Page1, $Page2, $Page3]
var current_page = 0

var seen1 = false
var seen2 = false
var seen3 = false



func enable_other_pages():
    next_page_button.visible = true

func next_page():
    if current_page >= len(pages):
        return
    
    current_page += 1
    pages[current_page - 1].visible = false
    pages[current_page].visible = true
    
    if not seen1 and current_page == 1:
        seen1 = true
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","egg_book_page_1")
    
    if not seen2 and current_page == 2:
        seen2 = true
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","egg_book_page_2")
    
    if not seen3 and current_page == 3:
        seen3 = true
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","egg_book_page_3")
        await State.dialogue_ended
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","new_birth")
    
    State.play_sound("res://assets/sounds/effects/page_flip.wav")

func prev_page():
    if current_page <= 0:
        return
    
    current_page -= 1
    pages[current_page + 1].visible = false
    pages[current_page].visible = true
    State.play_sound("res://assets/sounds/effects/page_flip.wav")
