extends Control

@export var action_items : Array[String]
@onready var inputholder: VBoxContainer = $Inputholder
@export var MainButton: Button 
 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_action_remap_items()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Escape"):
		if visible == true:
			hide()
		else: 
			show()
func create_action_remap_items(): 
	#var previous_item = inputholder.get_child(inputholder.get_child_count() - 1)
	for index in range(action_items.size()):
		var action = action_items[index]
		var label = Label.new()
		label.text =action
		label.theme  = load("res://Theme/RemapButton.tres")
		inputholder.add_child(label)
		
		
		var button = RemapButton.new()
		button.action =action
		#button.focus_neighbor_top = previous_item.get_path()
		#previous_item.focus_neighbor_bottom = button.get_path()
		
		#if index == action_items.size() - 1 :
		#	MainButton.focus_neighbor_top = button.get_path()
			#button.focus_neighbor_bottom = MainButton.get_path()
		#previous_item=button
		inputholder.add_child(button)
		
