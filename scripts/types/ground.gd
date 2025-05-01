class_name Ground extends Type

static var _instance: Ground = null

static func instance()->Ground:
	if !_instance:
		_instance = Ground.new()
	return _instance
	
func _init():
	value = types.GROUND
	advantages = [
		types.FIRE,
		types.ELECTRIC,
		types.POISON,
		types.ROCK,
		types.STEEL
	]
	immunities = [
		types.ELECTRIC
	]
	resistences = [
		types.POISON,
		types.ROCK
	]
	disadvantages = [
		types.FLYING,
		types.PSYCHIC,
		types.FAIRY,
	]
