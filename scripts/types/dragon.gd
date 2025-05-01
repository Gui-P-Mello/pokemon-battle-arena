class_name Dragon extends Type

static var _instance: Dragon = null

static func instance()->Dragon:
	if !_instance:
		_instance = Dragon.new()
	return _instance
	
func _init():
	value = types.DRAGON
	advantages = [
		types.DRAGON
	]
	resistences = [
		types.FIRE,
		types.WATER,
		types.ELECTRIC,
		types.GRASS
	]
	disadvantages = [
		types.ICE,
		types.DRAGON,
		types.FAIRY,
	]
