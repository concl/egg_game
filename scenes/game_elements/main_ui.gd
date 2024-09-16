extends Control

@onready var phone: Control = $PhoneElement/Phone
@onready var phone_element = $PhoneElement
@onready var egg_book_element = $EggBookElement
@onready var book_element = $BookElement
@onready var animation_player = $BookElement/AnimationPlayer
@onready var book = $BookElement/Book
@onready var evidence_choice: Control = $EvidenceChoice
@onready var egg_book: Control = $EggBookElement/EggBook

var _timeline_dialogue = true

var book_out = false
var phone_out = false
var egg_book_out = false


# Called when the node enters the scene tree for the first time.
#func _ready():
    #open_phone_cutscene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func load_state(ui_state: Dictionary):
    pass
    
func add_line_to_transcript(character, line):
    book.add_line_to_transcript(character, line)

func disable():
    visible = false

func enable():
    visible = true

func close_book_cutscene():
    animation_player.play("cutscene_close")

func open_book():
    animation_player.play("open_book")

func open_phone_cutscene():
    book_element.visible = false
    phone_element.visible = true
    var close_button: Button = $PhoneElement/CloseButton
    close_button.visible = false
    phone.open_homescreen()

func close_phone_cutscene():
    book_element.visible = true
    phone_element.visible = false
    var close_button: Button = $PhoneElement/CloseButton
    close_button.visible = true


func unlock_phone():
    phone.open_homescreen()

func the_choice():
    book_element.visible = false
    phone_element.visible = false
    egg_book_element.visible = false
    evidence_choice.visible = true

func choice_done():
    evidence_choice.visible = false

func open_egg_book_cutscene():
    egg_book_element.visible = true
    var close_button: Button = $EggBookElement/CloseButton
    close_button.hide()

    
func close_egg_book_cutscene():
    egg_book_element.visible = false
    var close_button = $EggBookElement/CloseButton
    close_button.show()

func enable_egg_book_other_pages():
    egg_book.enable_other_pages()
 
func toggle_book():
    if book_element.book_open:
        book_element.close()
    else:
        book_element.open()
    
func toggle_phone():
    if phone_out:
        phone_element.visible = false
        book_element.visible = true
        phone_out = false
    else:
        phone_element.visible = true
        book_element.visible = false
        egg_book_element.visible = false
        phone_out = true
    
func toggle_egg_book():
    if egg_book_out:
        egg_book_element.visible = false
        book_element.visible = true
        egg_book_out = false
    else:
        egg_book_element.visible = true
        book_element.visible = false
        phone_element.visible = false
        phone_out = false
        egg_book_out = true



func add_evidence_item(item_name):
    book.add_evidence_item(item_name)
