class_name BattleContext 

var user: Pokemon
var target: Pokemon = null
var move: Move

func _init(_user: Pokemon, _target: Pokemon, _move: Move):
	user = _user
	target = _target
	move = _move
