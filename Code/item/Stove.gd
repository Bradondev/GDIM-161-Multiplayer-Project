extends InterActAble



@export var possibleReices: Array[Repices]
@export var Currentingredients : Array[ingredient]
var CurrentDish : Repices
@export var label: RichTextLabel 
@export var progress_bar: TextureProgressBar 

@export var IconContainer: HBoxContainer 
var IsReady :bool = false

func InterAct():
	if IsReady and CurrentDish:
		CurrentBody.PickUpItem(CurrentDish)
		ShowLabel(false)
		return
	if Currentingredients.size() == 3:
		print_debug(Currentingredients.size() )
		CookItem()
		return	
	if 	!CurrentBody.CurrentItem:
		return
	
	
	if CurrentBody.CurrentItem.CanBeCooked:
		Currentingredients.append( CurrentBody.CurrentItem)
		CurrentBody.DropItem()
		UpdateIcon()
		return
	
		
		
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerTwo_Interact"):
			InterAct()

func UpdateIcon():
	var icons = IconContainer.get_children()
	var temp = 0
	if Currentingredients.is_empty():
		for texturerect in icons:
			texturerect.texture = null

	for item in Currentingredients:
		icons[temp].texture= item.Icon
		temp+=1
func CookItem():
	ShowLabel(true)
	var Repice = FindReices()
	if !Repice:
		return
		
	progress_bar.texture_progress = Repice.Icon
	var tween  = get_tree().create_tween()
	tween.tween_property(progress_bar, "value", 100, 4)
	await  tween.finished
	CurrentDish = Repice 
	IsReady = true
	ShowLabel(false)
	label.text = "[wave amp=50.0 freq=5.0 connected=1][center] Ready"
	label.show()
	progress_bar.show()
	progress_bar.texture_progress = Repice.Icon
	
	Currentingredients.clear()
	UpdateIcon()
	
	
func FindReices():
	for Reices in possibleReices:
		var temp = 0
		
		for ingredien in Currentingredients:
			
			for  ingredients in Reices.ingredients :
				
				if ingredients.Name == ingredien.Name:
					temp +=1 
					
				if temp >=3:
					return Reices
	return null
	
func  ShowLabel(canbeseen):
	label.text = "[wave amp=50.0 freq=5.0 connected=1][center] Cooking"
	label.visible = canbeseen
	progress_bar.visible = canbeseen
	progress_bar.value = 0
