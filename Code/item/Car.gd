extends InterActAble


@export var Items:Array[PickUpable] = []
@export var IconContainer: HBoxContainer 


func InterAct():
	if 	!CurrentBody.CurrentItem:
		return
	if CurrentBody.CurrentItem.CanBeSent:
		Items.append( CurrentBody.CurrentItem)
		print_debug("added tyhing to truck" , Items)
		CurrentBody.DropItem()
		UpdateIcon()
		return

		
		
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerOne_Interact"):
			InterAct()

func UpdateIcon():
	var icons = IconContainer.get_children()
	var temp = 0
	if Items.is_empty():
		for texturerect in icons:
			texturerect.texture = null

	for item in Items:
		icons[temp].texture= item.Icon
		temp+=1
func SendItem():
	UpdateIcon()
