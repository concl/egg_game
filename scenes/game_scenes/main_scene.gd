
extends GameScene

@onready var transition_manager = $TransitionManager
const TextBalloon = preload("res://dialogue/balloon.tscn")
@onready var main_ui = $UI/MainUI

# Called when the node enters the scene tree for the first time.
func _ready():
    transition_manager.fade_in()
    var balloon = TextBalloon.instantiate()
    get_tree().current_scene.add_child(balloon)
    balloon.start(load("res://dialogue/test_tutorial.dialogue"),"")
    await balloon.ended
    main_ui.toggle_book()
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
