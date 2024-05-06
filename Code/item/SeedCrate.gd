extends InterActAble


@export var SeedType: ingredient
@export var SeedIcon: Texture2D

func InterAct():
	if CurrentBody.CurrentItem == SeedType:
		CurrentBody.DropItem()
		return
	SeedType.Icon = SeedIcon
	CurrentBody.PickUpItem(SeedType)
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerOne_Interact"):
			InterAct()
