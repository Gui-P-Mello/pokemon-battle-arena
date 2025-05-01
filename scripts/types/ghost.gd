class_name Ghost extends Type

static var _instance: Ghost = null

static func instance()->Ghost:
	if !_instance:
		_instance = Ghost.new()
	return _instance
	
func _init():
	value = types.GHOST
	advantages = [
		types.PSYCHIC,
		types.GHOST
	]
	immunities = [
		types.NORMAL,
		types.FIGHTING
	]
	resistences = [
		types.POISON,
		types.BUG
	]
	disadvantages = [
		types.GHOST,
		types.DARK
	]
