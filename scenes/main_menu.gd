extends Control

@onready var main: Control = $Main
@onready var transition_manager = $TransitionManager
@onready var options = $Options
@onready var option_button = $Options/PanelContainer/CenterContainer/VBoxContainer/GridContainer/OptionButton

# panels:
# 0: Main
# 1: Continue (select saves)
# 2: Options
var state = 0
const intro_scene = "res://scenes/game_scenes/cutscenes/intro/intro.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
    transition_manager.fade_in()
    if State._language == "chinese":
        option_button.selected = 1
    elif State._language == "english":
        option_button.selected = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_play_pressed():
    transition_manager.fade_out()


func _on_quit_button_pressed():
    get_tree().quit()


func _on_transition_manager_transitioned(transition):
    if transition == "FadeOut":
        get_tree().change_scene_to_file(intro_scene)


func _on_options_button_pressed() -> void:
    main.hide()
    options.show()


func _on_return_button_pressed() -> void:
    options.hide()
    main.show()


func _on_check_button_toggled(toggled_on: bool) -> void:
    if toggled_on:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
    else:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_option_button_item_selected(index: int) -> void:
    if index == 0:
        State.change_language("english")
    elif index == 1:
        State.change_language("chinese")
