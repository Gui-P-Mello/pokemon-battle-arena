class_name Electric extends Type

static var _instance: Electric = null

static func instance()->Electric:
	if !_instance:
		_instance = Electric.new()
	return _instance
	
func _init():
	value = types.ELECTRIC
	advantages = [
		types.WATER,
		types.FLYING
	]
	resistences = [
		types.ELECTRIC,
		types.STEEL
	]
	disadvantages = [
		types.GROUND
	]
