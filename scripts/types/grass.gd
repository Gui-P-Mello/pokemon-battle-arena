class_name Grass extends Type

static var _instance: Grass = null

static func instance()->Grass:
	if !_instance:
		_instance = Grass.new()
	return _instance
	
func _init():
	value = types.GRASS
	advantages = [
		types.WATER,
		types.GROUND,
		types.ROCK
	]
	resistences = [
		types.GRASS,
		types.WATER,
		types.ELECTRIC,
		types.GROUND
	]
	disadvantages = [
		types.FIRE,
		types.ICE,
		types.POISON,
		types.FLYING,
		types.BUG
	]
