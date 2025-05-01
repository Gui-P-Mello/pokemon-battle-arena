class_name DamageCalculator

static func calculate_damage(context: BattleContext) -> float:
	var move: Move = context.move
	var user: Pokemon = context.user
	var target: Pokemon = context.target
	
	var damage: float = move.base_damage
	
	if context.move.is_damage_physical:
		damage += user._attack
	else:
		damage += user._special_attack
	
	if move.move_type in user._types:
		damage *= 1.5
	
	return damage
