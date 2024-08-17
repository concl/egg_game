extends Control

var solved = false

func check_win():
    pass
    
func play_dialogue():
    if solved:
        return
    
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_3_dialogue")
    
