@tool
@icon("res://assets/dialogue_item_icon.svg")
class_name DialogueItem extends SlideShowEntry

@export_group("Choices")
@export var choices: Array[DialogueChoice] = []: set = set_dialogue_choices


func set_dialogue_choices(new_dialogue_choices: Array[DialogueChoice]) -> void:
	for index in new_dialogue_choices.size():
		if new_dialogue_choices[index] == null:
			new_dialogue_choices[index] = DialogueChoice.new()
	choices = new_dialogue_choices
