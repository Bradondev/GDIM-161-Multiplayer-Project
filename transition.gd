extends ColorRect
class_name  transitionNode

# Called when the node enters the scene tree for the first time.
@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal transition_in_done
signal transition_out_done
 
func transition_in():
	animation_player.play("transitionIn")
 
func transition_out():
	animation_player.play("transitionOut")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "transitionIn":
		emit_signal("transition_in_done")
	elif anim_name == "transitionOut":
		emit_signal("transition_out_done")
