class_name DamageEffect extends Effect


func apply(context: BattleContext)->void:
	var damage: float = DamageCalculator.calculate_damage(context)
	context.target.take_damage(damage)
