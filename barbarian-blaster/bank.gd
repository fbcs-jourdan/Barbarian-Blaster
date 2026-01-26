extends MarginContainer

@export var starting_variable := 150
@onready var label: Label = $Label

var gold : int : 
	set(new_gold):
		gold = max(0, new_gold)
		label.text = "Gold: " + str(new_gold)


func _ready() -> void:
	gold = starting_variable
