
extends GameScene

@onready var transition_manager = $TransitionManager
@onready var main_ui = $UI/MainUI
@onready var main_scene: Node2D = $MainScene
@onready var egg_crack: Node2D = $EggCrack
@onready var birthed: Node2D = $Birthed
@onready var egg_wall: Node2D = $EggWall

# Called when the node enters the scene tree for the first time.
func _ready():
    transition_manager.fade_in()
    transition_manager.play_music()
    
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","first_scene")
    await State.dialogue_ended
    main_ui.toggle_book()
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func evidence_search_start():
    pass

func gathering_start():
    transition_manager.fade_out()
    await transition_manager.transitioned
    transition_manager.change_music("res://assets/sounds/music/interrogation_music.wav")
    transition_manager.fade_in()
    await transition_manager.transitioned
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue","gathering_1")
    await State.dialogue_ended
    get_tree().call_group("UI","enable")
    main_ui.open_book()
    

func egg_crack_scene():
    transition_manager.fade_out()
    await transition_manager.transitioned
    main_scene.hide()
    egg_crack.show()
    transition_manager.fade_in()

func egg_crack_to_birthed():
    transition_manager.fade_out()
    await transition_manager.transitioned
    transition_manager.change_music("res://assets/sounds/music/birth.wav")
    egg_crack.hide()
    birthed.show()
    transition_manager.fade_in()


func egg_wall_scene():
    transition_manager.fade_out()
    await transition_manager.transitioned
    birthed.hide()
    egg_wall.show()
    var im1 = $EggWall/Image1
    var im2 = $EggWall/Image2
    var im3 = $EggWall/Image3
    
    im1.texture = create_texture("user://first.png")
    im2.texture = create_texture("user://second.png")
    im3.texture = create_texture("user://third.png")
    
    transition_manager.fade_in()

func create_texture(path):
    var img = Image.new()
    var err = img.load(path)
    if(err != 0):
        print("error loading the image: " + path)
        return null
    var img_tex = ImageTexture.create_from_image(img)
    return img_tex

const OUTRO = preload("res://scenes/game_scenes/cutscenes/outro/outro.tscn")

func ending():
    transition_manager.fade_out()
    await transition_manager.transitioned
    get_tree().change_scene_to_packed(OUTRO)

func mute_audio():
    transition_manager.mute_audio()

func return_audio():
    transition_manager.return_audio()
