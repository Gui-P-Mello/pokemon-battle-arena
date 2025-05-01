class_name Steel extends Type

static var _instance: Steel = null

static func instance()->Steel:
	if !_instance:
		_instance = Steel.new()
	return _instance
	
func _init():
	value = types.STEEL
	advantages = [
		types.ICE,
		types.ROCK,
		types.FAIRY
	]
	immunities = [
		types.POISON
	]
	resistences = [
		types.NORMAL,
		types.GRASS,
		types.ICE,
		types.FLYING,
		types.PSYCHIC,
		types.BUG,
		types.ROCK,
		types.DRAGON,
		types.STEEL,
		types.FAIRY
	]
	disadvantages = [
		types.FIRE,
		types.FIGHTING,
		types.GROUND,
	]
