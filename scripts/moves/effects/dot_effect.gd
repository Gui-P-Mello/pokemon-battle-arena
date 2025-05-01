class_name DotEffect extends StatusEffect

@export var damage_per_second: float
func apply(context: BattleContext):
	context.target.add_status_effect(self)
	
func on_tick(target: Pokemon, delta:float ):
	target.take_damage(damage_per_second * delta)
	#print ("Applying dot: ", damage_per_second)
