extends Node3D

@export var turret_range := 10.0

var projectile = preload("res://turret/projectile.tscn")
var enemy_path : Path3D
var target : Node3D


#turn and look at an enemy
func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target != null:
		look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target != null:
		var proj = projectile.instantiate()
		add_child(proj)
		proj.global_position = global_position
		proj.direction = global_transform.basis.z
		
func find_best_target() -> Enemy:
	var best_target = null
	var best_progress = 0
	
	for enemy in enemy_path.get_children():
		if enemy is Enemy: 
			if enemy.progress > best_progress:
				var distance = global_position.distance_to(enemy.global_position)
				if distance <= turret_range:
					best_target = enemy
					best_progress = enemy.progress
	return best_target
		
