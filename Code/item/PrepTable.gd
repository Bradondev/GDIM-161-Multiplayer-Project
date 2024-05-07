extends InterActAble



@export var ItemToPrep: ingredient
@export var label: RichTextLabel 
@export var progress_bar: TextureProgressBar 

#var tween :Tween 

func InterAct():
	var CurrentItem = CurrentBody.CurrentItem
	
	if !CurrentItem:
		print_debug("has item")
		return
		
	if CurrentItem.IsAnIngredient and CurrentItem.CanBePreped:
		ItemToPrep =CurrentItem
		print_debug(CurrentBody)
		StartPrepping()
		pass
	
		
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerTwo_Interact"):
			print_debug(CurrentBody)
			InterAct()

func  StartPrepping():
	ShowLabel(true)
	progress_bar.texture_progress = ItemToPrep.PrepedIcon
	var tween  = get_tree().create_tween()
	tween.tween_property(progress_bar, "value", 100, 4)
	await  tween.finished
	ShowLabel(false)
	var PreppedItem = ItemToPrep.duplicate(true)
	PreppedItem.Icon = PreppedItem.PrepedIcon
	PreppedItem.IsPrepped = true
	print_debug(CurrentBody)
	CurrentBody.PickUpItem(PreppedItem)

func  ShowLabel(canbeseen):
	label.visible = canbeseen
	progress_bar.visible = canbeseen
	progress_bar.value = 0
