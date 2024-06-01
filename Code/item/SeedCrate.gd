extends InterActAble


@export var SeedType: Seed
@export var icon_1: Sprite2D 



func _ready() -> void:
	icon_1.texture = SeedType.SeedType.Icon
	inter_act_area.body_entered.connect(PlayerEnteredArea)
	inter_act_area.body_exited.connect( PlayerExitedArea)
func InterAct():
	if CurrentBody.CurrentItem == SeedType:
		CurrentBody.DropItem()
		return
		
	if !CurrentBody.CurrentItem:
		CurrentBody.PickUpItem(SeedType)
		print_debug("pick up seed")
		return
	
	
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerOne_Interact"):
			InterAct()
