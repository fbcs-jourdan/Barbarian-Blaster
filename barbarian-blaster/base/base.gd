extends Node3D
class_name Base

@export var max_health :int = 5


@onready var label_3d: Label3D = $Label3D

var health : int :
	set(new_health):
		health = new_health
		label_3d.text = str(health) + "/" + str(max_health)
		var red : Color = Color.RED
		var white : Color = Color.WHITE
		
		label_3d.modulate = red.lerp(white, float(health) / max_health)
		
		
		if health <= 0:
			get_tree().reload_current_scene()

func _ready() -> void:
	health = max_health
	#Engine.time_scale = 1

func take_damage() -> void:
	#print("damage taken by base")
	health -= 1
