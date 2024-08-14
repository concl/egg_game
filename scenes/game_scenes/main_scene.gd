
extends GameScene

@onready var transition_manager = $TransitionManager
@onready var main_ui = $UI/MainUI

# Called when the node enters the scene tree for the first time.
func _ready():
    transition_manager.fade_in()
    transition_manager.play_music()
    
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","first_scene")
    await State.dialogue_ended
    main_ui.toggle_book()
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


