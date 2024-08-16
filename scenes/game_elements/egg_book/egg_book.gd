extends Control

@onready var pages = [$Contents, $Page1, $Page2, $Page3]
var current_page = 0

func next_page():
    if current_page >= len(pages):
        return
    
    current_page += 1
    pages[current_page - 1].visible = false
    pages[current_page].visible = true
    State.play_sound("res://assets/sounds/effects/page_flip.wav")

func prev_page():
    if current_page <= 0:
        return
    
    current_page -= 1
    pages[current_page + 1].visible = false
    pages[current_page].visible = true
    State.play_sound("res://assets/sounds/effects/page_flip.wav")
