class_name Poison extends Type

static var _instance: Poison = null

static func instance()->Poison:
	if !_instance:
		_instance = Poison.new()
	return _instance
	
func _init():
	value = types.POISON
	advantages = [
		types.GRASS,
		types.FAIRY
	]
	resistences = [
		types.GRASS,
		types.FIGHTING,
		types.POISON,
		types.BUG,
		types.FAIRY
	]
	disadvantages = [
		types.GROUND,
		types.PSYCHIC
	]
