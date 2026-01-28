extends Node
class_name DifficultyManager

@export var game_length := 30
@export var spawn_time_curve : Curve
@export var enemy_heath_curve : Curve
@onready var timer: Timer = $Timer

signal stop_spawning_enemies

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(game_length)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(timer.time_left)
	pass

func game_progress_ratio() -> float:
	return 1.0 - timer.time_left / game_length
	
func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio()) 

func get_enemy_health() -> float:
	return enemy_heath_curve.sample(game_progress_ratio())

func _on_timer_timeout() -> void:
	stop_spawning_enemies.emit()
