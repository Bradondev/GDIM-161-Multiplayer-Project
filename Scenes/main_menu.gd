extends Control

@onready var main_menu: Panel = $MainMenu
@onready var settings: Panel = $Settings
@onready var load_game_panel: Panel = $LoadGamePanel
@export var GameSaver : Node
@export var SaveHodler : VBoxContainer
@export var CurrentPanel :Control


func _ready() -> void:
	GameSaver.AddLoadSaves()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	if settings.visible == false:
		settings.visible =true
		main_menu.visible = false
		CurrentPanel = settings
	
	
func _on_load_pressed() -> void:
	CurrentPanel = load_game_panel
	main_menu.visible = false
	load_game_panel.visible = true
func _on_new_game_pressed() -> void:
	$gameSaver.MakeNewSave()


func _on_back_pressed() -> void:
	CurrentPanel.visible = false
	main_menu.visible = true
	CurrentPanel = main_menu 





