extends Node3D

@export var turret_range := 10.0

var projectile = preload("res://turret/projectile.tscn")
var enemy_path : Path3D
var target : Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var turret_base: Node3D = $TurretBase
@onready var cannon: Node3D = $TurretBase/TurretTop/Cannon


#turn and look at an enemy
func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target != null:
		cannon.look_at(target.global_position, Vector3.UP, true)
		animation_player.play("fire")

func _on_timer_timeout() -> void:
	if target != null:
		var proj = projectile.instantiate()
		add_child(proj)
		proj.global_position = cannon.global_position
		proj.direction = cannon.global_transform.basis.z
		animation_player.play("fire")
		
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
		
