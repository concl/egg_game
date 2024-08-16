extends Node2D

@onready var special_text = $SpecialText
@onready var special_text_2 = $SpecialText2
@onready var special_text_3 = $SpecialText3
@onready var special_text_4 = $SpecialText4

signal ended

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func start():
    special_text.start()
    print("asdf")
    
func _on_special_text_end_click():
    special_text.exit_scene()
    special_text_2.start()

func _on_special_text_2_end_click():
    special_text_2.exit_scene()
    special_text_3.start()

func _on_special_text_3_end_click():
    special_text_3.exit_scene()
    special_text_4.start()

func _on_special_text_4_end_click():
    special_text_4.exit_scene()
    ended.emit()
