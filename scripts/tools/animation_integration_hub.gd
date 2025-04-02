@tool
extends AnimationPlayer

#Maps the name of the animation for the correspondent texture
@export var texture_animation_pair: Array[AnimationTexturePair]:
	set(value):
		texture_animation_pair = value
		print("test")
		update_animations()
		
func update_animations():
	if not Engine.is_editor_hint():
		return
		
	var sprite_node = get_node_or_null("../Sprite3D")
	if not sprite_node:
		return
	
	for pair in texture_animation_pair:
		var anim_name = pair.animation
		var texture = pair.texture
		if not has_animation(anim_name):
			continue
			
		var anim = get_animation(anim_name)
		
		#Creates or updates a texture's track
		var track_path = sprite_node.get_path()
		var track_index = anim.find_track(track_path, Animation.TYPE_VALUE)
		
		if track_index == -1:
			track_index = anim.add_track(Animation.TYPE_VALUE)
			anim.track_set_path(track_index, track_path)
			
		#Positions the keyframe at position 0
		if anim.track_get_key_count(track_index) == 0:
			anim.track_insert_key(track_index, 0, texture)
		else:
			anim.track_set_key_value(track_index,  0, texture)
