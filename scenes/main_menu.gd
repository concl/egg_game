extends Control

@onready var return_button = $Main/PanelContainer/VBoxContainer/ReturnButton
@onready var transition_manager = $TransitionManager
@onready var options = $Options

# panels:
# 0: Main
# 1: Continue (select saves)
# 2: Options
var state = 0


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_play_pressed():
    transition_manager.fade_out()


func _on_options_pressed():
    if state == 2:
        return
    options.visible = true
    return_button.visible = true
    state = 2

func _on_return_button_pressed():
    return_button.visible = false
    state = 0
    
    options.visible = false

func _on_check_button_toggled(toggled_on):
    if !toggled_on:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
    else:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_quit_button_pressed():
    get_tree().quit()


func _on_transition_manager_transitioned(transition):
    if transition == "FadeOut":
        get_tree().change_scene_to_file("res://scenes/game_scenes/intro.tscn")
