class_name Projectile extends RigidBody3D

@export var on_hit_effects: Array[Effect] = []
var context: BattleContext = null

func _on_body_entered(body):
	self.hide()
	var target: Pokemon = body as Pokemon
	context.move.apply_move_effects(context.move.on_hit_effects)
	#for effect: Effect in effects:
		#context.target = target
		#effect.apply(context)

