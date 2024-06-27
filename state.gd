extends Node

#class Change:
    #pass
    #
#class AddCharacter extends Change:
    #var character: String
    #var character_state: String
    #
    #func _init(character, character_state):
        #self.character = character
        #self.character_state = character_state
#
#class MoveCharacter extends Change:
    #var character: Character
    #var position: int
    #
    #func _init(character, position):
        #self.character = character
        #self.position = position
#
#class PlayAnimation extends Change:
    #var character: Character
    #var animation_name: String
    #
    #func _init(character, animation_name):
        #self.character = character
        #self.animation_name = animation_name


# array of changes: each element represents a change
var changes: Array
var test = null
var phase = 0
