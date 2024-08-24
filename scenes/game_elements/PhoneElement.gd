extends Control

@onready var main_ui = $".."
@onready var phone = $Phone
@onready var close_button = $CloseButton

func _on_close_button_pressed():
    main_ui.toggle_phone()
