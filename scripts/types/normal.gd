class_name Normal extends Type

static var _instance: Normal = null

static func instance()->Normal:
	if !_instance:
		_instance = Normal.new()
	return _instance

func _init():
	disadvantages = [types.FIGHTING]
	immunities = [types.GHOST]
