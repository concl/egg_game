extends Control

@onready var main_ui = $".."
@onready var phone = $Phone
@onready var close_button = $CloseButton

var phone_open = false

func open():
    phone.visible = true
    close_button.visible = true
    phone_open = true

func close():
    phone.visible = false
    close_button.visible = false
    phone_open = false

func _on_close_button_pressed():
    main_ui.toggle_phone()
