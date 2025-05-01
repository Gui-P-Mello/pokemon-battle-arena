#I don't know if I will use this
class_name StatModifierEffect extends Effect

@export var stat: String
@export var value: float
@export var is_percentage: bool
@export var affects_user: bool

func apply(context: BattleContext):
	var target_pokemon = context.user if affects_user else context.target
	var final_value = value
	
	if is_percentage:
		final_value = target_pokemon.get_stat(stat)*value
	
	target_pokemon.modify_status(stat, final_value)

