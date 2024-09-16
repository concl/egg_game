extends CanvasLayer

@onready var confirm_menu: PanelContainer = $Holder/Main/ConfirmMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _on_main_menu_button_pressed() -> void:
    confirm_menu.show()


func _on_continue_button_pressed() -> void:
    queue_free()


func _on_yes_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_no_pressed() -> void:
    confirm_menu.hide()
