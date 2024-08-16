extends Cutscene

@onready var transition_manager = $TransitionManager
@onready var part_1 = $Part1
@onready var final = $Final

var next_scene = "res://scenes/game_scenes/main_scene.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
    transition_manager.fade_in()
    var wait_time = Timer.new()
    wait_time.wait_time = 1.0
    wait_time.one_shot = true
    add_child(wait_time)
    wait_time.start()
    await wait_time.timeout
    wait_time.queue_free()
    
    #part_1.start()

func end_scene():
    State.play_sound("res://assets/sounds/effects/telephone_ringing.mp3")
    transition_manager.fade_out()
    await transition_manager.transitioned
    get_tree().change_scene_to_file(next_scene)

func _on_part_1_ended():
    final.start()


func _on_final_ended():
    end_scene()


func _on_video_stream_player_finished():
    end_scene()
