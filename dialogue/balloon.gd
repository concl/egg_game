extends CanvasLayer

## The action to use for advancing the dialogue
@export var next_action: StringName = &"ui_accept"

## The action to use to skip typing the dialogue
@export var skip_action: StringName = &"ui_cancel"

@onready var balloon: Control = %Balloon
@onready var character_label: RichTextLabel = %CharacterLabel
@onready var dialogue_label: DialogueLabel = %DialogueLabel
@onready var responses_menu: DialogueResponsesMenu = %ResponsesMenu
@onready var character_sprite: TextureRect = $Balloon/Panel/Dialogue/HBoxContainer/CharacterSprite
@onready var text_input: Control = $Balloon/TextInput

var character_names = {
    "侦探蛋哥": preload("res://assets/images/characters/small/eggspert_small.png"),
    "猫头鹰老爸": preload("res://assets/images/characters/small/op_small.png"),
    "猫头鹰老妈": preload("res://assets/images/characters/small/owlivia_small.png"),
    "卡皮巴拉": preload("res://assets/images/characters/small/capybala_small.png"),
    "宝石小兔": preload("res://assets/images/characters/small/rabbit_small.png"),
    "鹅婆婆": preload("res://assets/images/characters/small/nanny_goose_small.png"),
    "Eggspert": preload("res://assets/images/characters/small/eggspert_small.png"),
    "Mr. Owlbert": preload("res://assets/images/characters/small/op_small.png"),
    "Mrs. Owlivia": preload("res://assets/images/characters/small/owlivia_small.png"),
    "Sir Capybala": preload("res://assets/images/characters/small/capybala_small.png"),
    "Rappit": preload("res://assets/images/characters/small/rabbit_small.png"),
    "Nanny Goose": preload("res://assets/images/characters/small/nanny_goose_small.png")
}

var character_sounds = {
    "侦探蛋哥": ["res://assets/sounds/effects/character_blabber/eggspert_default.wav","res://assets/sounds/effects/character_blabber/eggspert_2.wav"],
    "猫头鹰老爸": ["res://assets/sounds/effects/character_blabber/owlbert_default.wav","res://assets/sounds/effects/character_blabber/owlbert_long.wav"],
    "猫头鹰老妈": ["res://assets/sounds/effects/character_blabber/owlivia_default.wav"],
    "卡皮巴拉": ["res://assets/sounds/effects/character_blabber/capibara_default.wav","res://assets/sounds/effects/character_blabber/capibara_2.wav","res://assets/sounds/effects/character_blabber/capibara_3.wav"],
    "宝石小兔": ["res://assets/sounds/effects/character_blabber/rabbit_1.wav","res://assets/sounds/effects/character_blabber/rabbit_2.wav"],
    "鹅婆婆": ["res://assets/sounds/effects/character_blabber/goose1.wav","res://assets/sounds/effects/character_blabber/goose2.wav","res://assets/sounds/effects/character_blabber/goose3.wav"],
    "Eggspert": ["res://assets/sounds/effects/character_blabber/eggspert_default.wav","res://assets/sounds/effects/character_blabber/eggspert_2.wav"],
    "Mr. Owlbert": ["res://assets/sounds/effects/character_blabber/owlbert_default.wav","res://assets/sounds/effects/character_blabber/owlbert_long.wav"],
    "Mrs. Owlivia": ["res://assets/sounds/effects/character_blabber/owlivia_default.wav"],
    "Sir Capybala": ["res://assets/sounds/effects/character_blabber/capibara_default.wav","res://assets/sounds/effects/character_blabber/capibara_2.wav","res://assets/sounds/effects/character_blabber/capibara_3.wav"],
    "Rappit": ["res://assets/sounds/effects/character_blabber/rabbit_1.wav","res://assets/sounds/effects/character_blabber/rabbit_2.wav"],
    "Nanny Goose": ["res://assets/sounds/effects/character_blabber/goose1.wav","res://assets/sounds/effects/character_blabber/goose2.wav","res://assets/sounds/effects/character_blabber/goose3.wav"]
}

signal next_message()
signal ended()

var rng = RandomNumberGenerator.new()

## The dialogue resource
var resource: DialogueResource

## Temporary game states
var temporary_game_states: Array = []

## See if we are waiting for the player
var is_waiting_for_input: bool = false

## See if we are running a long mutation and should hide the balloon
var will_hide_balloon: bool = false

var _locale: String = TranslationServer.get_locale()

var record_lines = true
var unskippable: bool = false
var turn_visible:
    set(setting):
        if !setting:
            balloon.modulate = Color(1, 1, 1, 0)
        else:
            balloon.modulate = Color(1, 1, 1, 1)

var show_text_input = false
var name_input:
    set(setting):
        show_text_input = true

var given_name: String

## The current line
var dialogue_line: DialogueLine:
    set(next_dialogue_line):
        is_waiting_for_input = false
        balloon.focus_mode = Control.FOCUS_ALL
        balloon.grab_focus()

        # The dialogue has finished so close the balloon
        if not next_dialogue_line:
            ended.emit()
            queue_free()
            return

        # If the node isn't ready yet then none of the labels will be ready yet either
        if not is_node_ready():
            await ready

        dialogue_line = next_dialogue_line

        character_label.visible = not dialogue_line.character.is_empty()
        character_label.text = tr(dialogue_line.character, "dialogue")

        dialogue_label.hide()
        dialogue_label.dialogue_line = dialogue_line

        responses_menu.hide()
        responses_menu.set_responses(dialogue_line.responses)
        
        text_input.hide()
        
        # Show our balloon
        balloon.show()
        will_hide_balloon = false
        
        dialogue_label.show()
        
        if not dialogue_line.character.is_empty():
            character_sprite.custom_minimum_size.x = 160
            character_sprite.custom_minimum_size.y = 192
            character_sprite.texture = character_names[character_label.text]
            
            var sound_ind = rng.randi_range(0,len(character_sounds[character_label.text]) - 1)
            State.play_sound(character_sounds[character_label.text][sound_ind])
            
        else:
            character_sprite.custom_minimum_size.x = 0
            character_sprite.custom_minimum_size.y = 0
            character_sprite.texture = null
        
        if not dialogue_line.text.is_empty():
            dialogue_label.type_out()
            await dialogue_label.finished_typing
        
        if record_lines:
            get_tree().call_group("UI","add_line_to_transcript", character_label.text, dialogue_line.text)
        
        if show_text_input:
            show_text_input = false
            text_input.show()

        # Wait for input
        if dialogue_line.responses.size() > 0:
            balloon.focus_mode = Control.FOCUS_NONE
            responses_menu.show()
        elif dialogue_line.time != "":
            var time = dialogue_line.text.length() * 0.02 if dialogue_line.time == "auto" else dialogue_line.time.to_float()
            await get_tree().create_timer(time).timeout
            next(dialogue_line.next_id)
        else:
            is_waiting_for_input = true
            balloon.focus_mode = Control.FOCUS_ALL
            balloon.grab_focus()
    get:
        return dialogue_line

func _on_button_pressed() -> void:
    given_name = $Balloon/TextInput/TextInput/TextEdit.text
    text_input.hide()


func _ready() -> void:
    rng.seed = 42069
    balloon.hide()
    Engine.get_singleton("DialogueManager").mutated.connect(_on_mutated)

    # If the responses menu doesn't have a next action set, use this one
    if responses_menu.next_action.is_empty():
        responses_menu.next_action = next_action


func _unhandled_input(_event: InputEvent) -> void:
    # Only the balloon is allowed to handle input while it's showing
    get_viewport().set_input_as_handled()


func _notification(what: int) -> void:
    # Detect a change of locale and update the current dialogue line to show the new language
    if what == NOTIFICATION_TRANSLATION_CHANGED and _locale != TranslationServer.get_locale() and is_instance_valid(dialogue_label):
        var visible_ratio = dialogue_label.visible_ratio
        self.dialogue_line = await resource.get_next_dialogue_line(dialogue_line.id)
        if visible_ratio < 1:
            dialogue_label.skip_typing()


## Start some dialogue
func start(dialogue_resource: DialogueResource, title: String, extra_game_states: Array = []) -> void:
    temporary_game_states =  [self] + extra_game_states
    is_waiting_for_input = false
    resource = dialogue_resource
    self.dialogue_line = await resource.get_next_dialogue_line(title, temporary_game_states)
    next_message.emit()
    


## Go to the next line
func next(next_id: String) -> void:
    self.dialogue_line = await resource.get_next_dialogue_line(next_id, temporary_game_states)
    next_message.emit()
    


#region Signals


func _on_mutated(_mutation: Dictionary) -> void:
    is_waiting_for_input = false
    will_hide_balloon = true
    get_tree().create_timer(0.1).timeout.connect(func():
        if will_hide_balloon:
            will_hide_balloon = false
            balloon.hide()
    )


func _on_balloon_gui_input(event: InputEvent) -> void:
    if unskippable:
        return
    
    # See if we need to skip typing of the dialogue
    if dialogue_label.is_typing:
        var mouse_was_clicked: bool = event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed()
        var skip_button_was_pressed: bool = event.is_action_pressed(skip_action)
        if mouse_was_clicked or skip_button_was_pressed:
            get_viewport().set_input_as_handled()
            dialogue_label.skip_typing()
            return

    if not is_waiting_for_input: return
    if dialogue_line.responses.size() > 0: return

    # When there are no response options the balloon itself is the clickable thing
    get_viewport().set_input_as_handled()

    if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
        next(dialogue_line.next_id)
    elif event.is_action_pressed(next_action) and get_viewport().gui_get_focus_owner() == balloon:
        next(dialogue_line.next_id)


func _on_responses_menu_response_selected(response: DialogueResponse) -> void:
    next(response.next_id)


#endregion
