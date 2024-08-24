extends Control

var seen_dialogue = false
@onready var dialogue_history: Label = $ScrollContainer/VBoxContainer/DialogueHistory



func play_dialogue():
    print("asdf")
    if seen_dialogue:
        return
    else:
        seen_dialogue = true
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_0_dialogue")



func add_line_to_transcript(line):
    dialogue_history.text += line + "\n"
