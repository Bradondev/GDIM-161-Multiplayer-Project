extends Control

@onready var main_menu: Panel = $MainMenu
@onready var settings: Panel = $Settings
@onready var load_game_panel: Panel = $LoadGamePanel
@export var GameSaver : Node
@export var SaveHodler : VBoxContainer
@export var CurrentPanel :Control
@onready var credit: Panel = $Credit
@onready var creditButton: TextureButton = $MainMenu/SubButtons/credit
@export var PopUp : TextureRect
@export var TransitonNode: transitionNode
@onready var new_game: TextureButton = $MainMenu/HBoxContainer/NewGame
var IsLoading = false

var overWorld = load("res://Scenes/OverWorld.tscn")

func _ready() -> void:
	#for button in get_tree().get_nodes_in_group("MenuButton"):
		#button.
	process_mode = Node.PROCESS_MODE_ALWAYS
	TransitonNode.transition_in()
	new_game.grab_focus()

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	if settings.visible == false:
		settings.visible =true
		main_menu.visible = false
		CurrentPanel = settings
		$Settings/back.grab_focus()
	
func _on_load_pressed() -> void:
	if IsLoading:
		return
	IsLoading = true
	print_debug("Load game")
	TransitonNode.transition_out()
	
	await  TransitonNode.transition_out_done
	get_tree().change_scene_to_packed(overWorld)
	#CurrentPanel = load_game_panel
	#main_menu.visible = false
	#load_game_panel.visible = true
func _on_new_game_pressed() -> void:
	var dir = DirAccess.open("res://saves/")
	
	if dir.get_files().size() == 0:
		$gameSaver.MakeNewSave()
	else:
		PopUp.visible = true
		$PopUp/SubButtons/Sure.grab_focus()
	

func _on_back_pressed() -> void:
	CurrentPanel.visible = false
	BackToMain()
	CurrentPanel = main_menu 



func BackToMain():
	main_menu.visible = true
	new_game.grab_focus()

func _on_credit_pressed() -> void:
	CurrentPanel = credit
	main_menu.visible = false
	credit.visible = true
	$Credit/back.grab_focus()

func _PopUP_back_pressed() -> void:
	PopUp.visible = false
	BackToMain()

func _PopUp_sure_pressed() -> void:
	$gameSaver.MakeNewSave()
	_on_load_pressed()


