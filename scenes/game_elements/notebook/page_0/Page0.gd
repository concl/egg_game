extends Control

var seen_dialogue = false
@onready var dialogue_history: RichTextLabel = $VBoxContainer/ScrollContainer/VBoxContainer/DialogueHistory


func play_dialogue():
    if seen_dialogue:
        return
    else:
        seen_dialogue = true
        State.start_dialogue("scenes","page_0_dialogue")


func add_line_to_transcript(character, line):
    
    dialogue_history.text += "[b]" + character + "[/b]: " + line + "\n\n"
