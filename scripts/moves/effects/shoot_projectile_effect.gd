class_name ShootProjectileEffect extends Effect

var projectile_move: ProjectileMove

func apply(context: BattleContext):
	if context.move is ProjectileMove:
		projectile_move = context.move
	var projectile_instance: Projectile = projectile_move.projectile.instantiate()
	projectile_instance.position = context.user.cast_point.global_position
	projectile_instance.rotation = context.user.cast_point.global_rotation
	projectile_instance.context = context
	
	var forward_direction = projectile_instance.transform.basis.z.normalized()
	projectile_move.projectile_speed = 1500
	var impulse_vector = forward_direction * projectile_move.projectile_speed
	
	context.user.get_tree().current_scene.add_child(projectile_instance)
	projectile_instance.apply_force(impulse_vector)
	
