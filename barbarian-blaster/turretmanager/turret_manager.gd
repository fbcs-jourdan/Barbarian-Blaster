extends Node3D
class_name TurretManager

@export var turret : PackedScene
@export var enemy_path : Path3D

#turn and look at an enemy
func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)

func build_turret(position:Vector3) -> void:
	var new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = position
	new_turret.enemy_path = enemy_path
