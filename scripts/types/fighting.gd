class_name Fighting extends Type

static var _instance: Fighting = null

static func instance()->Fighting:
	if !_instance:
		_instance = Fighting.new()
	return _instance
	
func _init():
	value = types.FIGHTING
	advantages = [
		types.NORMAL,
		types.ICE,
		types.ROCK,
		types.DARK
	]
	resistences = [
		types.BUG,
		types.ROCK,
		types.DARK
	]
	disadvantages = [
		types.FLYING,
		types.PSYCHIC,
		types.FAIRY,
	]
