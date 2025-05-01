class_name Dark extends Type

static var _instance: Dark = null

static func instance()->Dark:
	if !_instance:
		_instance = Dark.new()
	return _instance
	
func _init():
	value = types.DARK
	advantages = [
		types.PSYCHIC,
		types.GHOST
	]
	immunities = [
		types.PSYCHIC
	]
	resistences = [
		types.GHOST,
		types.DARK
	]
	disadvantages = [
		types.FIGHTING,
		types.BUG,
		types.FAIRY
	]
