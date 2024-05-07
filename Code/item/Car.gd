extends InterActAble


@export var Items:Array[PickUpable] 


func InterAct():
	pass

	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerOne_Interact"):
			InterAct()
