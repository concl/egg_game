extends Control

@onready var return_button = $Main/PanelContainer/VBoxContainer/ReturnButton
@onready var transition_manager = $TransitionManager
@onready var options = $Options
@onready var continue_button = $Main/PanelContainer/VBoxContainer/ContinueButton

# panels:
# 0: Main
# 1: Continue (select saves)
# 2: Options
var state = 0
const intro_scene = "res://scenes/game_scenes/cutscenes/intro/intro.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
    transition_manager.play_music()
    if not FileAccess.file_exists("user://savegame.save"):
        continue_button.disabled = true


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
