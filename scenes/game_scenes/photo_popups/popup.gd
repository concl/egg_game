extends TextureRect

var dialogue_file = "res://dialogue/script/evidence_search_chinese.dialogue"
var header: String


func _ready():
    play_dialogue_file()

func play_dialogue_file():
    State.start_dialogue(dialogue_file,header)
    await State.dialogue_ended
    queue_free()

            
