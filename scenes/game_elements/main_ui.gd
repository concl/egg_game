extends Control

@onready var phone_element = $PhoneElement
@onready var egg_book_element = $EggBookElement
@onready var book_element = $BookElement
@onready var animation_player = $BookElement/AnimationPlayer
@onready var page2_container = $Page2/NotValuable/GridContainer
@onready var book = $BookElement/Book

var _timeline_dialogue = true

var book_out = false
var phone_out = false
var egg_book_out = false

# State Variables
var book_page_1_solved = false
var book_page_2_solved = false
var book_page_3_solved = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func load_state(ui_state: Dictionary):
    pass
    
func toggle_book():
    if book_element.book_open:
        book_element.close()
    else:
        book_element.open()
    
func toggle_phone():
    if phone_element.phone_open:
        phone_element.visible = false
        book_element.visible = true
        phone_element.close()
    else:
        phone_element.visible = true
        book_element.visible = false
        egg_book_element.visible = false
        phone_element.open()
    
func toggle_egg_book():
    if egg_book_out:
        egg_book_element.visible = false
        book_element.visible = true
        egg_book_out = false
    else:
        egg_book_element.visible = true
        book_element.visible = false
        phone_element.visible = false
        egg_book_out = true
        

func add_evidence_item(item_name):
    book.add_evidence_item(item_name)
