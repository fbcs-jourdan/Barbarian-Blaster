extends CanvasLayer

@onready var base := get_tree().get_first_node_in_group("Base")
@onready var bank := get_tree().get_first_node_in_group("Bank")
@onready var star_2: TextureRect = %Star2
@onready var star_3: TextureRect = %Star3

@onready var health_label: Label = %HealthLabel
@onready var gold_label: Label = %GoldLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()

func victory() -> void:
	visible = true
	if base.health == base.max_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true
	if bank.gold >= 500:
		gold_label.visible = true
		star_3.modulate = Color.WHITE
