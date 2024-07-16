extends Control

@onready var animation_player = $AnimationPlayer
@onready var book = $Book
@onready var open_button = $OpenButton

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_open_button_pressed():
    animation_player.play("open_book")


func _on_close_button_pressed():
    animation_player.play("close_book")


