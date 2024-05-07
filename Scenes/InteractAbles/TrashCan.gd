extends InterActAble

func InterAct():
	if CurrentBody:
		CurrentBody.DropItem()
		return
	
	
	
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerTwo_Interact"):
			InterAct()
