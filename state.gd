extends Node

class Change:
    pass
    
class AddCharacter extends Change:
    var character: Character
    var character_state: String

class MoveCharacter extends Change:
    var character: Character
    var position: int



# array of changes: each 
var changes: Array
var test = null
var phase = 0
