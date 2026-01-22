extends Node3D

var projectile = preload("res://turret/projectile.tscn")

var enemy_path : Path3D


func _on_timer_timeout() -> void:
	var proj = projectile.instantiate()
	add_child(proj)
	proj.global_position = global_position
	
