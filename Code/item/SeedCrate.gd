extends InterActAble


@export var SeedType: Seed


func InterAct():
	if CurrentBody.CurrentItem == SeedType:
		CurrentBody.DropItem()
		return
		
	if !CurrentBody.CurrentItem:
		CurrentBody.PickUpItem(SeedType)
		return
	
	
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerOne_Interact"):
			InterAct()
