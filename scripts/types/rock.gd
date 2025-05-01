class_name Rock extends Type

static var _instance: Rock = null

static func instance()->Rock:
	if !_instance:
		_instance = Rock.new()
	return _instance
	
func _init():
	value = types.ROCK
	advantages = [
		types.FIRE,
		types.ICE,
		types.FLYING,
		types.BUG
	]
	resistences = [
		types.NORMAL,
		types.FIRE,
		types.POISON,
		types.FLYING
	]
	disadvantages = [
		types.WATER,
		types.GRASS,
		types.FIGHTING,
		types.GROUND,
		types.STEEL
	]
