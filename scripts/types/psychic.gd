class_name Psychic extends Type

static var _instance: Psychic = null

static func instance()->Psychic:
	if !_instance:
		_instance = Psychic.new()
	return _instance
	
func _init():
	value = types.FLYING
	advantages = [
		types.FIGHTING,
		types.POISON,
		types.BUG
	]
	resistences = [
		types.FIGHTING,
		types.PSYCHIC,
	]
	disadvantages = [
		types.BUG,
		types.GHOST,
		types.DARK,
	]
