class_name Fire extends Type

static var _instance: Fire = null

static func instance()->Fire:
	if !_instance:
		_instance = Fire.new()
	return _instance
	
func _init():
	value = types.FIRE
	advantages = [
		types.GRASS,
		types.ICE,
		types.BUG,
		types.STEEL,
	]
	resistences = [
		types.FIRE,
		types.GRASS,
		types.BUG,
		types.STEEL,
		types.FAIRY
	]
	disadvantages = [
		types.WATER,
		types.GROUND,
		types.ROCK
	]
