class_name Fairy extends Type

static var _instance: Fairy = null

static func instance()->Fairy:
	if !_instance:
		_instance = Fairy.new()
	return _instance
	
func _init():
	value = types.FAIRY
	advantages = [
		types.FIGHTING,
		types.DRAGON,
		types.DARK
	]
	immunities = [
		types.DRAGON
	]
	resistences = [
		types.FIGHTING,
		types.BUG,
		types.DARK
	]
	disadvantages = [
		types.POISON,
		types.STEEL
	]
