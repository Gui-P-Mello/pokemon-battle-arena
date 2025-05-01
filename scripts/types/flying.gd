class_name Flying extends Type

static var _instance: Flying = null

static func instance()->Flying:
	if !_instance:
		_instance = Flying.new()
	return _instance
	
func _init():
	value = types.FLYING
	advantages = [
		types.GRASS,
		types.FIGHTING,
		types.BUG
	]
	immunities = [
		types.GROUND
	]
	resistences = [
		types.GRASS,
		types.FIGHTING,
		types.BUG
	]
	disadvantages = [
		types.ELECTRIC,
		types.ICE,
		types.ROCK,
	]
