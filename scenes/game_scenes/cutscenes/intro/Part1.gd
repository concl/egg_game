extends Node2D

@onready var special_text = $SpecialText
@onready var special_text_2 = $SpecialText2
@onready var special_text_3 = $SpecialText3
@onready var test_sprite = $TestSprite
@onready var animation_player = $TestSprite/AnimationPlayer

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
    special_text_2.start()

func _on_special_text_2_end_click():
    special_text_3.start()
    animation_player.play("fade_in")

func _on_special_text_3_end_click():
    special_text.exit_scene()
    special_text_2.exit_scene()
    special_text_3.exit_scene()
    animation_player.play("fade_out")
    
    await animation_player.animation_finished
    test_sprite.queue_free()
    ended.emit()
