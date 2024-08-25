extends Control

@onready var image_1: TextureRect = $Image1
@onready var image_2: TextureRect = $Image2
@onready var image_3: TextureRect = $Image3
@onready var prev_page: Button = $PrevPage


func play_dialogue():
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","page_7_dialogue")
    image_1.texture = create_texture("user://first.png")
    image_2.texture = create_texture("user://second.png")
    image_3.texture = create_texture("user://third.png")
    print(image_1.texture.get_image())

func create_texture(path):
    var img = Image.new()
    var err = img.load(path)
    if(err != 0):
        print("error loading the image: " + path)
        return null
    var img_tex = ImageTexture.create_from_image(img)
    return img_tex

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
