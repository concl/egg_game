extends Control

@onready var animation_player = $AnimationPlayer
@onready var book = $Book
@onready var open_button = $OpenButton

var book_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func open():
    animation_player.play("open_book")
    book_open = true


func close():
    animation_player.play("close_book")
    book_open = false


