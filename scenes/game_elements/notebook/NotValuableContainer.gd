extends GridContainer

@onready var page_2 = $"../.."

func _can_drop_data(at_position, data):
    return data[0] is TextureRect

func _drop_data(at_position, data):
    
    if data[1] == self:
        return
    else:
        data[1].remove_child(data[0])
        add_child(data[0])
        page_2.valuable_items.erase(data[0].name)
        page_2.not_valuable_items[data[0].name] = null
        page_2.check_win()

