extends Node2D

@export var transition: transitionNode

@export var FirstLevel: Control


func _ready() -> void:
	transition.transition_in()
	FirstLevel.grab_focus()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
