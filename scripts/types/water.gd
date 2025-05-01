class_name Water extends Type

static var _instance: Water = null

static func instance()->Water:
	if !_instance:
		_instance = Water.new()
	return _instance
	
func _init():
	value = types.WATER
	advantages = [
		types.FIRE,
		types.GROUND,
		types.ROCK
	]
	resistences = [
		types.WATER,
		types.FIRE,
		types.ICE,
		types.STEEL
	]
	disadvantages = [
		types.ELECTRIC,
		types.GRASS,
	]
