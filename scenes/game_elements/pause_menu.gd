extends CanvasLayer

@onready var confirm_menu: PanelContainer = $Holder/Main/ConfirmMenu
@onready var options: Control = $Holder/Options
@onready var main: Control = $Holder/Main
@onready var option_button: OptionButton = $Holder/Options/PanelContainer/CenterContainer/VBoxContainer/GridContainer/OptionButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    if State._language == "chinese":
        option_button.selected = 1
    elif State._language == "english":
        option_button.selected = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _on_main_menu_button_pressed() -> void:
    confirm_menu.show()


func _on_continue_button_pressed() -> void:
    State.paused = false
    queue_free()


func _on_yes_pressed() -> void:
    State.paused = false
    get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_no_pressed() -> void:
    confirm_menu.hide()


func _on_options_button_pressed() -> void:
    main.hide()
    options.show()
    


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


func _on_return_button_pressed() -> void:
    options.hide()
    main.show()
