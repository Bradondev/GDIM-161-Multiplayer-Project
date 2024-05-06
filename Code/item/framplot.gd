extends InterActAble


@export var SeedType: ingredient
@export var plant: Sprite2D 
@export var label: RichTextLabel 
var Ready :bool = false
#var tween :Tween 

func InterAct():
	if CurrentBody.CurrentItem:
		SeedType = CurrentBody.CurrentItem
		CurrentBody.DropItem()
		plant.visible = true
		Growplant()
		return
		
	if SeedType and Ready:
			CurrentBody.PickUpItem(SeedType)
			plant.scale = Vector2(.1,.1)
			plant.visible = false
			ShowLabel(false)
			return
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerOne_Interact"):
			InterAct()

func Growplant():
	var tween  = get_tree().create_tween()
	tween.tween_property(plant, "scale", Vector2(.6,.6), 5)
	await  tween.finished
	ShowLabel(true)
func  ShowLabel(canbeseen):
	label.visible = canbeseen
	Ready = canbeseen
