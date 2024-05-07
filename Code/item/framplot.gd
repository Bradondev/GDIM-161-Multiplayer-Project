extends InterActAble


@export var SeedType: Seed
@export var plant: Sprite2D 
@export var label: RichTextLabel 
var Ready :bool = false
#var tween :Tween 

func InterAct():
	if SeedType and CurrentBody.CurrentItem:
		return
	
	if SeedType and Ready and !CurrentBody.CurrentItem:
		CurrentBody.PickUpItem(SeedType.SeedType)
		plant.scale = Vector2(.1,.1)
		SeedType = null
		ShowLabel(false)
		return
	
	if !CurrentBody.CurrentItem:
		return
		
	if CurrentBody.CurrentItem.IsSeed:
		SeedType = CurrentBody.CurrentItem
		CurrentBody.DropItem()
		Growplant()
		return
		
	
		
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerOne_Interact"):
			InterAct()

func Growplant():
	plant.visible = true
	var tween  = get_tree().create_tween()
	tween.tween_property(plant, "scale", Vector2(.6,.6), 5)
	await  tween.finished
	ShowLabel(true)
func  ShowLabel(canbeseen):
	plant.visible = canbeseen
	label.visible = canbeseen
	Ready = canbeseen
