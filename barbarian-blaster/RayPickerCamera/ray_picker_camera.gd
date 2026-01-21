extends Camera3D

@export var gridmap : GridMap

@onready var ray_cast_3d: RayCast3D = $RayCast3D

func _process(delta: float) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100
	# update the ray_cast_3d immediately
	ray_cast_3d.force_raycast_update()
	
	#printt(ray_cast_3d.get_collider(), ray_cast_3d.get_collision_point())
	
	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		if collider is GridMap:
			
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = gridmap.local_to_map(collision_point)
			if Input.is_action_just_pressed("click"):
				if gridmap.get_cell_item(cell) == 0:
					gridmap.set_cell_item(cell, 1)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
