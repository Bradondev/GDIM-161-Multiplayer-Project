extends Node

var LoadButton = preload("res://Scenes/SaveLoaderButton.tscn")
func  Save_Game():
	var saveData = SavedData.new()
	

	
	
func MakeNewSave():
	var NewSave = SavedData.new()
	var dir = DirAccess.open("res://saves/")
	var size = dir.get_files().size()
	ResourceSaver.save(NewSave,"res://saves/savegame" + str(size)+ ".tres")
	var NewButton = LoadButton.instantiate()
	NewButton.text = "save " + str( dir.get_files().size())
	$"../LoadGamePanel/SaveHolder".add_child(NewButton)
	
func AddLoadSaves():
	var Temp = 0
	print_debug("load save")
	var dir = DirAccess.open("res://saves/")
	print_debug(dir.get_files())
	for Saves in dir.get_files():
		Temp+=1
		var NewButton = LoadButton.instantiate()
		NewButton.text = "save " + str( Temp)
		$"../LoadGamePanel/SaveHolder".add_child(NewButton)
		
