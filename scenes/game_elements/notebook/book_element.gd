extends Control

@onready var animation_player = $AnimationPlayer
@onready var book = $Book
@onready var open_button = $OpenButton

signal done
var book_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func open():
    animation_player.play("open_book")
    await animation_player.animation_finished
    book.play_current_dialogue()
    book_open = true


func close():
    if book.page_number != 7 or State.seventh_book_page_solved:
        animation_player.play("close_book")
        book_open = false
    else:
        State.page_7_done()
        book.pages[7].prev_page.show()
