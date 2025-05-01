class_name Ice extends Type

static var _instance: Ice = null

static func instance()->Ice:
	if !_instance:
		_instance = Ice.new()
	return _instance
	
func _init():
	value = types.ICE
	advantages = [
		types.GRASS,
		types.GROUND,
		types.FLYING,
		types.DRAGON
	]
	resistences = [
		types.ICE
	]
	disadvantages = [
		types.FIRE,
		types.FIGHTING,
		types.ROCK,
		types.STEEL,
	]
