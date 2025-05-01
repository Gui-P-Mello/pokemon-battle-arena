extends Node

var loaded_resources: Dictionary = {}
	
func load_for_pokemon(pokemons: Array) -> void:
	var paths: Array = _get_unique_resources_path(pokemons)
	await _load_resources_async(paths)

func _get_unique_resources_path(pokemons: Array) -> Array:
	var paths: Array[String] = []
	var seen_moves: Dictionary = {}
	var seen_effects: Dictionary = {}
	
	for pokemon: Pokemon in pokemons:
		for move: Move in pokemon.move_set:
			if ! seen_moves.has(move.resource_path):
				paths.append(move.resource_path)
				seen_moves[move.resource_path] = true
				print("Move ", move.move_name, " loaded")
				if move is ProjectileMove:
					var projectile_move: ProjectileMove = move as ProjectileMove
					paths.append(projectile_move.projectile.resource_path)
				
			for effect: Effect in move.effects:
				if ! seen_effects.has(effect.resource_path):
					paths.append(effect.resource_path)
					seen_effects[effect.resource_path] = true
					print("Effect loaded")
	return paths
	
func _load_resources_async(paths: Array) -> void:
	for path in paths:
		if not loaded_resources.has(path):
			var loader = ResourceLoader.load_threaded_request(path)
			while ResourceLoader.load_threaded_get_status(path) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
				await get_tree().process_frame
			loaded_resources[path] = ResourceLoader.load_threaded_get(path)
