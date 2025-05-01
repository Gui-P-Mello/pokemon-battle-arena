class_name Bug extends Type

static var _instance: Bug = null

static func instance()->Bug:
	if !_instance:
		_instance = Bug.new()
	return _instance
	
func _init():
	value = types.BUG
	advantages = [
		types.GRASS,
		types.PSYCHIC,
		types.DARK
	]
	resistences = [
		types.GRASS,
		types.FIGHTING,
		types.GROUND
	]
	disadvantages = [
		types.FIRE,
		types.FLYING,
		types.ROCK,
	]
