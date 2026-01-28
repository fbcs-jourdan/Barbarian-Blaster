extends Path3D

@export var enemy_scene : PackedScene
@export var difficulty_manager : Node
@onready var timer: Timer = $Timer



func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	
	timer.wait_time = difficulty_manager.get_spawn_time()
	enemy.max_health = difficulty_manager.get_enemy_health()
	add_child(enemy)


func _on_timer_timeout() -> void:
	spawn_enemy()
